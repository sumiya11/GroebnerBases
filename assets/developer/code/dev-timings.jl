# This file was generated, do not modify it. # hide
using Groebner, AbstractAlgebra
_, (x,y,z) = GF(2^31-1)["x","y","z"]
groebner([x*y + z, x*z + y], statistics=:timings)