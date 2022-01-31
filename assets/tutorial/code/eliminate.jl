# This file was generated, do not modify it. # hide
R, (t, x, y) = PolynomialRing(QQ, ["t", "x", "y"])
@assert y < x < t

F = [x - 2t + 4t^3, y - t^2 + 3t^4]   # initial system

G = groebner(F)