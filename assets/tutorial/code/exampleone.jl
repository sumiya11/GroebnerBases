# This file was generated, do not modify it. # hide
using Groebner
G = groebner(F)
println("Basis is $G \nLeading Ideal is $(map(leading_term, G))")