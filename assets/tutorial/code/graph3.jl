# This file was generated, do not modify it. # hide
_, (x1, x2, x3, x4) = QQ["x1","x2","x3","x4"]

coloring_system = [
  x1^3 - 1, x2^3 - 1, x3^3 - 1, x4^3 - 1,
  x1^2 + x1*x2 + x2^2,
  x1^2 + x1*x3 + x3^2,
  x1^2 + x1*x4 + x4^2,
  x2^2 + x2*x3 + x3^2,
  x3^2 + x3*x4 + x4^2
]

groebner(coloring_system)