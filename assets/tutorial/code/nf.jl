# This file was generated, do not modify it. # hide
F = [x^3 + y^2, x*y + x^2]
f = x^4*y^2 + y^3 + x^2 + x*y + 1

G = groebner(F)     # compute the basis
normalform(G, f)    # divide f by G