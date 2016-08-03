#include "uart.h"

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

#include <util/delay.h>

#include <stdint.h>
#include <string.h>
#include <stdlib.h>

/*const uint8_t nums[] = {
		      0x01,
		      0x02,
		      0x04,
		      0x08,
		      0x10,
		      0x20,
		      0x40,
		      0x80
		      };*/

const uint8_t digits[] = {
  0x04 | 0x08 | 0x10 | 0x20 | 0x40 | 0x80,
  0x20 | 0x40,
  0x80 | 0x40 | 0x02 | 0x08 | 0x10,
  0x02 | 0x80 | 0x10 | 0x20 | 0x40,
  0x02 | 0x04 | 0x20 | 0x40,
  0x80 | 0x04 | 0x02 | 0x20 | 0x10,
  0x80 | 0x04 | 0x02 | 0x08 | 0x10 | 0x20,
  0x80 | 0x40 | 0x20,
  0x02 | 0x04 | 0x08 | 0x10 | 0x20 | 0x40 | 0x80,
  0x02 | 0x04 | 0x20 | 0x40 | 0x80,
};

// AT+UART_DEF=9600,8,1,0,0

// AT+CWLAP
// AT+CWJAP_DEF="SSID","password"
// AT+CWDHCP_DEF=1

// AT+CIFSR
// +CIFSR:STAIP,"192.168.1.179"
// +CIFSR:STAMAC,"60:01:94:06:56:cd"

// AT+CIPMUX=1

// AT+CIPSSLSIZE=4096
// AT+CIPSTART=<link>,"SSL","iot.espressif.cn",8443

// AT+CIPSTART=<link>,"TCP","iot.espressif.cn",8000

// AT+CIPSEND=<link>,<len>

const uint8_t NUM_DIGITS = 8;

void spi_init() {
  DDRB |= 4 | 8 | 32;
  PORTB &= ~(4 | 8 | 32);

}

void spi_bit(int b) {
  PORTB |= (b ? 8 : 0);
  _delay_us(10);

  PORTB |= 32;
  _delay_us(10);

  PORTB &= ~8;
  _delay_us(10);

  PORTB &= ~32;
  _delay_us(10);
}

void spi_byte(uint8_t b) {
  for (int i = 0; i < 8; ++i) {
    spi_bit(b & 1);
    b >>= 1;
  }
}

void latch() {
    PORTB |= 4;
    _delay_us(10);

    PORTB &= ~4;
    _delay_us(10);
}

void color_init() {
  DDRD |= 4 | 8;
  PORTD &= ~(4 | 8);
}

void color(uint8_t r) {
  if (r) {
    PORTD &= ~8;
    _delay_us(1000);
    PORTD |= 4;
  } else {
    PORTD &= ~4;
    _delay_us(1000);
    PORTD |= 8;
  }
}

void clear() {
  for (int i = 0; i < NUM_DIGITS; ++i) {
    spi_byte(0);
  }
}

char display_red[NUM_DIGITS+1] = "        ";
char display_green[NUM_DIGITS+1] = "        ";
uint8_t dots[NUM_DIGITS+20] = {0};

uint8_t get_digit(char c) {
  if (c >= '0' && c <= '9') {
    return digits[c - '0'];
  }
  return 0;
}

uint16_t n = 0;

void update() {
  static int r = 1;
  //if (n > 5000) {
  //  r = 1-r;
  //  color(r);
  //  n = 0;
    //}
  char* d = r ? display_red : display_green;
  clear();
  for (int i = 0; i < NUM_DIGITS; ++i) {
    uint8_t b = get_digit(d[i]);
    if (dots[i]) {
      b |= 1;
    }
    spi_byte(b);
  }
  latch();
}

void uart_string_p(const char* s) {
  while (true) {
    char c = pgm_read_byte(s++);
    if (!c) {
      return;
    }
    while (!uart_write_ready()) {
      _delay_us(5);
    }
    uart_write(c);
  }
}

bool match_prefix(const char* a, const char* b) {
  return strncmp(a, b, strlen(b)) == 0;
}

enum states_t {
  STATE_NONE,
  STATE_GET_IP,
  STATE_MUX,
  STATE_START,
  STATE_CONNECT,
  STATE_SEND,
  STATE_REPLY,
  STATE_CLOSE,
  STATE_SLEEP,
};

bool got_ok = false;
bool got_error = false;
bool got_prompt = false;
bool got_ip = false;
bool got_data = false;
bool got_closed = false;

char data[1024] = {0};
uint16_t data_len = 0;

void read_esp() {
  static char line[100] = {0};
  static char* p = line;

  while (uart_available()) {
    *p = uart_read();
    if (match_prefix(line, "> ")) {
      got_prompt = true;
    }
    if (*p == ':' && match_prefix(line, "+IPD,0,")) {
      *p = 0;
      uint16_t len = atoi(line + 7);
      data_len = len;
      char* d = data;
      while (len > 0) {
	while (!uart_available()) {
	  _delay_us(5);
	}
	*d = uart_read();
	++d;
	--len;
      }
      got_data = true;
    }
    if (*p == '\n' || *p == '\r') {
      if (match_prefix(line, "OK") || match_prefix(line, "SEND OK")) {
	got_ok = true;
      }
      if (match_prefix(line, "ERROR")) {
	got_error = true;
      }
      if (match_prefix(line, "0:CLOSED")) {
	got_closed = true;
      }
      if (match_prefix(line, "+CIFSR:STAIP,") && !match_prefix(line, "+CIFSR:STAIP,\"0.0.0.0\"")) {
	got_ip = true;
      }
      p = line;
      continue;
    }
    p++;
  }
}

void flash(uint8_t index) {
  dots[index] = 1 - dots[index];
  update();
}

uint16_t t = 0;
uint8_t current_state = STATE_NONE;
uint8_t next_state = STATE_GET_IP;

void move_state(uint8_t state) {
  current_state = STATE_NONE;
  next_state = state;
  t = 0;
}

void send_at(const char* at) {
  got_ok = false;
  got_error = false;
  got_prompt = false;
  got_data = false;
  got_closed = false;
  uart_string_p(at);
}

void process_line(char* line) {
  if (data[0] == 'r') {
    memset(display_red, ' ', NUM_DIGITS);
    strncpy(display_red, line+1, NUM_DIGITS);
  }
  if (data[0] == 'g') {
    memset(display_green, ' ', NUM_DIGITS);
    strncpy(display_green, line+1, NUM_DIGITS);
  }
}

void process_commands() {
  char* line = data;
  while (true) {
    char* eol = strchr(line, '\n');
    if (!eol) {
      return;
    }
    *eol = 0;
    process_line(line);
    do {
      ++eol;
    } while (*eol == '\r' || *eol == '\n');
    line = eol;
  }
}

int main() {
  MCUSR &= ~(1 << WDRF);
  wdt_disable();

  clock_prescale_set(clock_div_2);

  spi_init();

  color_init();
  color(1);

  uart_init(9600, false);

  uart_string_p(PSTR("AT+RST\r\n"));

  for (;; ++t) {
    _delay_ms(1);
    ++n;

    read_esp();

    if (t % 100 == 0) {
      flash(next_state);
    }

    if (current_state == STATE_NONE) {
      if (t > 500) {
	got_ok = false;
	memset(dots, 0, sizeof(dots));
	current_state = next_state;
	t = 0;
      } else {
	continue;
      }
    }

    if (current_state == STATE_GET_IP) {
      if (t % 5000 == 0) {
	send_at(PSTR("AT+CIFSR\r\n"));
      }
      if (got_ip) {
	move_state(STATE_MUX);
      }
    } else if (current_state == STATE_MUX) {
      if (t == 0) {
	send_at(PSTR("AT+CIPMUX=1\r\n"));
      }
      if (got_ok) {
        move_state(STATE_START);
      }
      if ((t > 1000 && got_error) || t > 2000) {
	move_state(STATE_MUX);
      }
    } else if (current_state == STATE_START) {
      if (t == 0) {
	send_at(PSTR("AT+CIPSTART=0,\"TCP\",\"192.168.1.174\",12345\r\n"));
      }
      if (got_ok && t < 500) {
        move_state(STATE_CONNECT);
      }
      //if ((t > 1000 && got_error) || t > 2000) {
      if (t == 500) {
	send_at(PSTR("AT+SLEEP=2\r\n"));
      }
      if (t > 20000) {
	move_state(STATE_START);
      }
    } else if (current_state == STATE_CONNECT) {
      if (t == 0) {
	send_at(PSTR("AT+CIPSEND=0,7\r\n"));
      }
      if (got_prompt) {
        move_state(STATE_SEND);
      }
      if ((t > 1000 && got_error) || t > 5000) {
	move_state(STATE_START);
      }
    } else if (current_state == STATE_SEND) {
      if (t == 0) {
	send_at(PSTR("HELLO\r\n"));
      }
      if (got_ok) {
        move_state(STATE_REPLY);
      }
    } else if (current_state == STATE_REPLY) {
      if (got_data) {
	process_commands();
      }
      if (got_closed) {
	move_state(STATE_SLEEP);
      }
      if (t > 60000) {
	move_state(STATE_CLOSE);
      }
    } else if (current_state == STATE_CLOSE) {
      if (t == 0) {
	send_at(PSTR("AT+CIPCLOSE=0\r\n"));
      }
      if (got_ok || got_closed || got_error) {
        move_state(STATE_SLEEP);
      }
      if (t > 2000) {
	move_state(STATE_CLOSE);
      }
    } else if (current_state == STATE_SLEEP) {
      if (t == 0) {
	send_at(PSTR("AT+SLEEP=2\r\n"));
      }
      if (t > 1000) {
	move_state(STATE_START);
      }
    }
  }

  return 0;
}
