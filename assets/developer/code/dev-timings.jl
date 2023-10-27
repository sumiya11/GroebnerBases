# This file was generated, do not modify it. # hide
using Groebner, AbstractAlgebra

# Enable performance counters
Groebner.performance_counters_enabled() = true

R, (x,y,z) = GF(2^31-1)["x","y","z"]

groebner([x*y + z, x*z + y], statistics=:no) #hide
groebner([x*y + z, x*z + y], statistics=:timings)