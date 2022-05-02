# This file was generated, do not modify it. # hide
using DynamicPolynomials

@polyvar x
f = (x^2 - 1)^7*(x + 3)*(x - 7)^4
g = (x + 3)*(x + 7)

groebner([f, g])   # gcd by groebner