#include <stdint.h>

#include <avr/io.h>
#include <util/delay.h>

void
uart_init(const uint32_t baud, const bool double_speed) {
  UBRR0 = 103;//416;//207;//12;//51;//3;//8;//12;

  UCSR0C = ((1 << UCSZ01) | (1 << UCSZ00));
  UCSR0B = ((1 << RXEN0) | (1 << TXEN0));
  UCSR0A = (1 << U2X0);

  DDRD |= (1 << 1);
  PORTD |= (1 << 0);
}

void
uart_disable() {
  UCSR0B = 0;
  UCSR0A = 0;
  UCSR0C = 0;

  UBRR0 = 0;

  DDRD &= ~(1 << 3);
  PORTD &= ~(1 << 2);
}

bool
uart_available() {
  return ((UCSR0A & (1 << RXC0)) ? true : false);
}

bool
uart_write_ready() {
  return ((UCSR0A & (1 << UDRE0)) ? true : false);
}

bool
uart_write_complete() {
  return ((UCSR0A & (1 << TXC0)) ? true : false);
}

void
uart_write(const char b) {
  while (!(uart_write_ready()))
    ;
  UDR0 = b;
}

int16_t
uart_read() {
  if (!uart_available())
    return -1;

  return UDR0;
}

uint8_t
uart_read_blocking() {
  while (!uart_available()) {
  }

  return UDR0;
}
