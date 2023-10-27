# This file was generated, do not modify it. # hide
using Groebner, AbstractAlgebra

R, (x,y,z) = GF(2^31-1)["x","y","z"]

# Will print some debug info.
# Use lower loglevel, e.g., loglevel=-5, to print A LOT of info
groebner([x*y + z, x*z + y], loglevel=-2)