# This file was generated, do not modify it. # hide
using DynamicPolynomials # hide
@polyvar x y z
system = [
       x - y + z + 1,
       x + 2y + 3z + 4,
       x + y + 5z + 3
]

groebner(system)  # rref