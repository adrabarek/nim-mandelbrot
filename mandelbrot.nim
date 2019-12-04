import math
import complex

const 
  screen_width = 100
  screen_height = 50
  max_iters = 100
  cutoff = 1.0e8

proc f(z: Complex64, c: Complex64): Complex64 =
  return pow(z, 2.0) + c

proc test_pixel(x: int, y: int): bool =
  let
    sw = float(screen_width)
    sh = float(screen_height)
    r = 4.0*(float(x)/sw - 0.5f)
    i = 4.0*(float(y)/sh - 0.5f)
    c = complex64(r, i)
  var 
    z = complex64(0.0, 0.0)

  for i in 0..<max_iters:
    z = f(z, c)
    if abs(z) > cutoff:
      return false
  return true

for y in countDown(screen_height - 1, 0):
  for x in 0..<screen_width:
    if test_pixel(x, y):
      write(stdout, '@')
    else:
      write(stdout, ' ')
  write(stdout, '\n')