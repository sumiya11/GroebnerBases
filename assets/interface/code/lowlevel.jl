# This file was generated, do not modify it. # hide
using Groebner
# define {x y - 1, x^3 + 7 y^2} modulo 65537 in DRL
ring = Groebner.PolyRing(2, Groebner.DegRevLex(), 65537)
monoms = [ [[1, 1], [0, 0]], [[3, 0], [0, 2]] ]
coeffs = [ [1, -1], [1, 7] ]
# compute a GB
gb_monoms, gb_coeffs = Groebner.groebner(ring, monoms, coeffs)