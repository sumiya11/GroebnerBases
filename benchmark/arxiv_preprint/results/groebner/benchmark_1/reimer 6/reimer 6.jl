# reimer 6
#! format: off
using AbstractAlgebra, Groebner

ring, (x1, x2, x3, x4, x5, x6) = PolynomialRing(
    GF(2147483647), 
    ["x1", "x2", "x3", "x4", "x5", "x6"], 
    ordering=:degrevlex
)
system = [
	2*x1^2 + 2147483645*x2^2 + 2*x3^2 + 2147483645*x4^2 + 2*x5^2 + 2147483645*x6^2 + 2147483646,
	2*x1^3 + 2147483645*x2^3 + 2*x3^3 + 2147483645*x4^3 + 2*x5^3 + 2147483645*x6^3 + 2147483646,
	2*x1^4 + 2147483645*x2^4 + 2*x3^4 + 2147483645*x4^4 + 2*x5^4 + 2147483645*x6^4 + 2147483646,
	2*x1^5 + 2147483645*x2^5 + 2*x3^5 + 2147483645*x4^5 + 2*x5^5 + 2147483645*x6^5 + 2147483646,
	2*x1^6 + 2147483645*x2^6 + 2*x3^6 + 2147483645*x4^6 + 2*x5^6 + 2147483645*x6^6 + 2147483646,
	2*x1^7 + 2147483645*x2^7 + 2*x3^7 + 2147483645*x4^7 + 2*x5^7 + 2147483645*x6^7 + 2147483646
]
