import math
import complex

proc mandelbrot_test(c: Complex64, max_iters: int, cutoff: float): bool =
  proc f(z: Complex64, c: Complex64): Complex64 =
    return pow(z, 2.0) + c
  var 
    z = complex64(0.0, 0.0)

  for i in 0..<max_iters:
    z = f(z, c)
    if abs(z) > cutoff:
      return false
  return true

const 
  screen_width = 100
  screen_height = 50
  screen_width_f = float(screen_width)
  screen_height_f = float(screen_height)
  max_iters = 100
  cutoff = 1.0e2  

for y in countDown(screen_height - 1, 0):
  let fy = float(y)
  for x in 0..<screen_width:
    var
      r = 4.0*(float(x)/screen_width_f - 0.5)
      i = 4.0*(fy/screen_height_f - 0.5)
      c = complex64(r, i)
    if mandelbrot_test(c, max_iters, cutoff):
      write(stdout, '@')
    else:
      write(stdout, '.')
  write(stdout, '\n')