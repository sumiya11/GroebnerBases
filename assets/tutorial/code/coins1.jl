# This file was generated, do not modify it. # hide
_, (p, n, d, q) = polynomial_ring(QQ, ["p","n","d","q"], internal_ordering=:deglex)

F = [p^5 - n, p^10 - d, p^25 - q]   # initial constraints

G = groebner(F)   # more nice and useful constraints