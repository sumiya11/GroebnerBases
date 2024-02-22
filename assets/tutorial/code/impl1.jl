# This file was generated, do not modify it. # hide
using AbstractAlgebra
_, (t, x, y) = polynomial_ring(QQ, ["t", "x", "y"], internal_ordering=:lex)

groebner([t^2*y - 2t + y, t^2*x + t^2 + x - 1])