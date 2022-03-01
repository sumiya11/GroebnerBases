# This file was generated, do not modify it. # hide
# Here, F₁ and F₂ generate the same infinite polynomial sets
F₁ = [x^3 + y^3, x*y + x^2, x^3 - y^2]
F₂ = [x^3 - y^2, x*y + x^2]
groebner(F₁) == groebner(F₂)