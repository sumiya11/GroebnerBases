# noon 7
#! format: off
using AbstractAlgebra, Groebner

ring, (x1, x2, x3, x4, x5, x6, x7) = PolynomialRing(
    GF(2147483647), 
    ["x1", "x2", "x3", "x4", "x5", "x6", "x7"], 
    ordering=:degrevlex
)
system = [
	10*x1*x2^2 + 10*x1*x3^2 + 10*x1*x4^2 + 10*x1*x5^2 + 10*x1*x6^2 + 10*x1*x7^2 + 2147483636*x1 + 10,
	10*x1^2*x2 + 10*x2*x3^2 + 10*x2*x4^2 + 10*x2*x5^2 + 10*x2*x6^2 + 10*x2*x7^2 + 2147483636*x2 + 10,
	10*x1^2*x3 + 10*x2^2*x3 + 10*x3*x4^2 + 10*x3*x5^2 + 10*x3*x6^2 + 10*x3*x7^2 + 2147483636*x3 + 10,
	10*x1^2*x4 + 10*x2^2*x4 + 10*x3^2*x4 + 10*x4*x5^2 + 10*x4*x6^2 + 10*x4*x7^2 + 2147483636*x4 + 10,
	10*x1^2*x5 + 10*x2^2*x5 + 10*x3^2*x5 + 10*x4^2*x5 + 10*x5*x6^2 + 10*x5*x7^2 + 2147483636*x5 + 10,
	10*x1^2*x6 + 10*x2^2*x6 + 10*x3^2*x6 + 10*x4^2*x6 + 10*x5^2*x6 + 10*x6*x7^2 + 2147483636*x6 + 10,
	10*x1^2*x7 + 10*x2^2*x7 + 10*x3^2*x7 + 10*x4^2*x7 + 10*x5^2*x7 + 10*x6^2*x7 + 2147483636*x7 + 10
]
