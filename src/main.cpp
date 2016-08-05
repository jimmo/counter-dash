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
#include <stdio.h>

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

char display[NUM_DIGITS+1] = "        ";
uint8_t dots[NUM_DIGITS+20] = {0};

uint8_t get_digit(char c) {
  if (c >= '0' && c <= '9') {
    return digits[c - '0'];
  }
  if (c == ' ') {
    return 0;
  }
  return 2;
}

void update() {
  clear();
  for (int i = 0; i < NUM_DIGITS; ++i) {
    uint8_t b = get_digit(display[i]);
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

void uart_string(const char* s) {
  while (true) {
    char c = *s++;
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

bool match_suffix(const char* a, const char* b) {
  return strncmp(a-strlen(b), b, strlen(b)) == 0;
}

class esp8266_t {
public:
  class socket_t {
  public:
    socket_t() : n_(0), in_use_(false), esp_(nullptr), len_(0) {
    }

    int send(const uint8_t* data, uint16_t len) {
      char at[100];
      sprintf(at, "AT+CIPSEND=%d,%d\r\n", n_, len);
      int x = esp_->send_cmd(at);
      if (x != CMD_OK) {
	return x;
      }
      while (uart_read() != '>') {
	_delay_us(5);
      }
      for (uint16_t i = 0; i < len; ++i) {
	uart_write(data[i]);
      }
      return esp_->wait_result();
    }

    bool closed() {
      return !in_use_;
    }

    bool available() {
      if (!in_use_) {
	return false;
      }
      if (len_ > 0) {
	return true;
      }

      esp_->wait_data();

      return len_ > 0;
    }

    uint8_t read() {
      if (len_ == 0) {
	return 0;
      }
      --len_;
      return uart_read_blocking();
    }

    int send(const char* str) {
      return send(reinterpret_cast<const uint8_t*>(str), strlen(str));
    }

    int close() {
      char at[100];
      in_use_ = false;
      sprintf(at, "AT+CIPCLOSE=%d\r\n", n_);
      return esp_->send_cmd(at);
    }

    int n_;
    bool in_use_;
    esp8266_t* esp_;
    uint16_t len_;
  };

  enum cmd_result_t {
    CMD_OK,
    CMD_ERROR,
    CMD_SEND_OK,
  };

  int reset() {
    _delay_ms(500);
    return send_cmd_p(PSTR("AT+RST\r\n"));
  }

  bool has_ip() {
    clear_recv();
    uart_string_p(PSTR("AT+CIFSR\r\n"));
    while (true) {
      wait_line();
      if (match_prefix(buf_, "+CIFSR:STAIP,")) {
	if (match_prefix(buf_, "+CIFSR:STAIP,\"0.0.0.0\"")) {
	  return false;
	} else {
	  return true;
	}
      }
      if (strcmp(buf_, "ERROR") == 0) {
	return false;
      }
    }
  }

  socket_t* connect(const char* host, int port) {
    if (send_cmd_p(PSTR("AT+CIPMUX=1\r\n")) != CMD_OK) {
      return nullptr;
    }

    socket_t* s = get_free_socket();
    if (!s) {
      return nullptr;
    }
    s->in_use_ = true;
    char at[100];
    sprintf(at, "AT+CIPSTART=%d,\"TCP\",\"%s\",%d\r\n", s->n_, host, port);
    if (send_cmd(at) != CMD_OK) {
      s->in_use_ = false;
      return nullptr;
    }
    return s;
  }

  int join(const char* ssid, const char* password) {
    char at[100];
    sprintf(at, "AT+CWJAP_DEF=\"%s\",\"%s\"\r\n", ssid, password);
    return send_cmd(at);
  }

  int sleep() {
    return send_cmd_p(PSTR("AT+SLEEP=2\r\n"));
  }

private:
  socket_t s_[4];
  char buf_[64];

  int send_cmd_p(const char* cmd) {
    clear_recv();
    uart_string_p(cmd);
    return wait_result();
  }

  int send_cmd(const char* cmd) {
    clear_recv();
    uart_string(cmd);
    return wait_result();
  }

  void clear_recv() {
    while (uart_available()) {
      uart_read();
    }
  }

  int wait_result() {
    while (true) {
      wait_line();
      if (strcmp(buf_, "OK") == 0) {
	return CMD_OK;
      }
      if (strcmp(buf_, "ERROR") == 0) {
	return CMD_ERROR;
      }
      if (strcmp(buf_, "SEND OK") == 0) {
	return CMD_ERROR;
      }
    }
  }

  void wait_line() {
    int i = 0;
    while (true) {
      buf_[i] = uart_read_blocking();
      if (buf_[i] == '\r' || buf_[i] == '\n') {
	buf_[i] = 0;
	return;
      }
      ++i;
    }
  }

  socket_t* get_free_socket() {
    for (int i = 0; i < 4; ++i) {
      if (!s_[i].in_use_) {
        s_[i].n_ = i;
        s_[i].esp_ = this;
	return &s_[i];
      }
    }
    return nullptr;
  }

  void wait_data() {
    char buf[64];
    uint16_t i = 0;

    while (i < sizeof(buf)) {
      buf[i] = uart_read_blocking();

      if (buf[i] == '\n' || buf[i] == '\r') {
      	i = 0;
      	continue;
      }
      ++i;

      if (match_suffix(buf+i, ",CLOSED")) {
	int socknum = buf[i - 8] - '0';
	if (socknum >= 0 && socknum <= 3) {
	  s_[socknum].len_ = 0;
	  s_[socknum].in_use_ = false;
	}
	return;
      }
      if (match_suffix(buf+i, "+IPD,")) {
	int n = uart_read_blocking() - '0';
	if (n >= 0 && n <= 3) {
	  uart_read_blocking();
	  char len[10];
	  uint16_t j = 0;
	  while (j < sizeof(len)) {
	    len[j] = uart_read_blocking();
	    if (len[j] == ':') {
	      len[j] = 0;
	      s_[n].len_ = atoi(len);
	      return;
	    }
	    j++;
	  }
	} else {
	  return;
	}
      }
    }
  }
};

uint16_t ticks = 0;
uint8_t current_color = 1;

uint32_t prev[2] = { 0, 0 };
uint32_t prev_ticks[2] = { 0, 0 };
uint32_t current[2] = { 0, 0 };
uint32_t speed[2] = { 0, 0 };

uint32_t strtou32(const char* s) {
  uint32_t x = 0;
  while (*s) {
    x *= 10;
    x += *s - '0';
    s++;
  }
  return x;
}

void u32tostr(char* s, uint8_t len, uint32_t x) {
  bool z = true;
  do {
    if (x > 0 || z) {
      s[len-1] = x%10 + '0';
      z = false;
    } else {
      s[len-1] = ' ';
    }
    x /= 10;
    --len;
  } while (len != 0);
}

void process_line(char* line, uint16_t len, uint16_t num) {
  if (num >= 2) {
    return;
  }
  if (num == num) {
    prev[num] = current[num];
    current[num] = strtou32(line);
    if (prev[num] != 0 && current[num] > prev[num]) {
      speed[num] = (current[num] - prev[num]) / (ticks - prev_ticks[num]);
    } else {
      speed[num] = 0;
    }
    prev_ticks[num] = ticks;
  }
}

void sleep(uint16_t ms) {
  ms -= ms % 100;
  while (ms != 0) {
    ms -= 100;
    ++ticks;
    if (ticks % 8 == 0) {
      current[0] += speed[0] * 8;
      current[1] += speed[1] * 8;
      u32tostr(display, NUM_DIGITS, current[current_color]);
      update();
    }
    if (ticks % 64 == 0) {
      current_color = 1 - current_color;
      color(current_color);
      u32tostr(display, NUM_DIGITS, current[current_color]);
      update();
    }
    _delay_ms(100);
  }
}

int main() {
  MCUSR &= ~(1 << WDRF);
  wdt_disable();

  clock_prescale_set(clock_div_2);

  spi_init();

  color_init();
  color(1);

  for (int i = 0 ; i < NUM_DIGITS; ++i) {
    dots[i] = 1;
    update();
    _delay_ms(50);
  }

  for (int i = 0 ; i < NUM_DIGITS; ++i) {
    dots[i] = 0;
    update();
    _delay_ms(50);
  }

  uart_init(76800, false);

  esp8266_t esp;
  esp.reset();

  _delay_ms(2000);

  esp.join("ssid", "password");

  _delay_ms(2000);

  // Each iteration of this loop gets one value from the server.
  while (true) {
    // Make sure we're on the network.
    while (true) {
      sleep(500);
      if (esp.has_ip()) {
	break;
      }
    }

    // TCP connect.
    esp8266_t::socket_t* s = esp.connect("192.168.0.15", 8000);
    if (!s) {
      esp.sleep();
      sleep(5000);
      continue;
    }

    for (int i = 0 ; i < NUM_DIGITS; ++i) {
      dots[NUM_DIGITS-1] = 1;
      update();
    }

    s->send("GET /dashboard HTTP/1.1\r\n");
    s->send("Host: 192.168.0.15:8000\r\n");
    s->send("\r\n");

    char buf[256];
    uint16_t i = 0;

    uint16_t l = 0;
    bool content = false;
    while (!s->closed() && i < sizeof(buf)) {
      if (s->available()) {
	uint8_t x = s->read();
	if (x == '\r') {
	  continue;
	}
	if (x == '\n' || i == sizeof(buf)) {
	  buf[i] = 0;
	  if (i == 0) {
	    content = true;
	  } else {
	    if (content) {
	      process_line(buf, i, l);
	      ++l;
	    }
	  }
	  i = 0;
	} else {
	  buf[i] = x;
	  ++i;
	}
      }
    }

    s->close();

    for (int i = 0 ; i < NUM_DIGITS; ++i) {
      dots[NUM_DIGITS-1] = 0;
      update();
    }

    // Success. Go to sleep for 10s.
    esp.sleep();
    sleep(10000);
  }

  return 0;
}
