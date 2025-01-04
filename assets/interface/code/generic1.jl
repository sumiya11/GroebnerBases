# This file was generated, do not modify it. # hide
using Groebner, Nemo

R, t = GF(101, 7)["t"]
ff = fraction_field(R)
_, (x, y) = ff["x","y"]

sys = [(t//t+1)*x*y - t^3, y^2 + t]

gb = groebner(sys)
gb