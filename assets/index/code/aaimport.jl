# This file was generated, do not modify it. # hide
using DynamicPolynomials

@polyvar x1 x2
system = [10*x1*x2^2 - 11*x1 + 10,
        10*x1^2*x2 - 11*x2 + 10]

groebner(system)