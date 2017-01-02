import http
import time
import machine

time.sleep(5)

u = machine.UART(0)
u.init(9600)

while True:
  r = http.get('http://ncssmurder-andrkun.rhcloud.com/simple_stats')
  #r = http.get('http://192.168.1.174:8000/dashboard')
  try:
    r.raise_for_status()
    lines = r.text.strip().split('\n')
    if len(lines) == 2:
      u.write('g:' + lines[0] + ';')
      time.sleep(0.01)
      u.write('r:' + lines[1] + ';')
      time.sleep(1)
  except OSError:
    pass
  r.close()
  time.sleep(5.0)
