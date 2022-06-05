# This file was generated, do not modify it. # hide
_, (p, n, d, q) = PolynomialRing(QQ, ["p","n","d","q"], ordering=:deglex)

F = [p^5 - n, p^10 - d, p^25 - q]   # initial constraints

G = groebner(F)   # more nice and useful constraints