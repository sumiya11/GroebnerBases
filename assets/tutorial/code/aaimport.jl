# This file was generated, do not modify it. # hide
using AbstractAlgebra
R, (x, y) = PolynomialRing(QQ, [:x, :y])
F = [x^3 + y^2, x*y + x^2];
# the Ideal generated by F
# would contain p₁F[1] + p₂F[2] for all possible pᵢ