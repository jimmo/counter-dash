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

const uint8_t NUM_DIGITS = 4;

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

char display[NUM_DIGITS+1] = "    ";
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

bool match_prefix(const char* a, const char* b) {
  return strncmp(a, b, strlen(b)) == 0;
}

bool match_suffix(const char* a, const char* b) {
  return strncmp(a-strlen(b), b, strlen(b)) == 0;
}

uint16_t ticks = 0;
uint8_t current_color = 1;

uint32_t current[2] = { 0, 0 };

const int TICKS_MS = 1;
const int TICKS_PER_COLOR_CHANGE = 2000;

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

int main() {
  MCUSR &= ~(1 << WDRF);
  wdt_disable();

  clock_prescale_set(clock_div_2);

  spi_init();

  color_init();
  color(1);

  for (int j = 0; j < 2; ++j) {
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
  }

  uart_init(9600, false);

  char line[200] = {0};
  uint8_t pos = 0;

  while (true) {
    while (uart_available()) {
      if (pos >= sizeof(line)) {
        pos = 0;
      }
      line[pos] = uart_read_blocking();
      if (line[pos] == ';') {
        line[pos] = 0;

        if (match_prefix(line, "g:")) {
          current[0] = strtou32(line + 2);
        } else if (match_prefix(line, "r:")) {
          current[1] = strtou32(line + 2);
        }

        pos = 0;
        line[pos] = 0;
      } else {
        ++pos;
      }
    }

    if (ticks % TICKS_PER_COLOR_CHANGE == 0) {
      current_color = 1 - current_color;
      color(current_color);
      u32tostr(display, NUM_DIGITS, current[current_color]);
      update();
    }

    _delay_ms(TICKS_MS);
    ++ticks;
  }

  return 0;
}
