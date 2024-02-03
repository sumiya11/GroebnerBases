# DAISY_mamil3_with_weights
#! format: off
using AbstractAlgebra, Groebner

ring, (x1_8, x1_7, x3_7, x2_7, x1_6, x3_6, x2_6, x1_5, x3_5, x2_5, x1_4, x3_4, x2_4, x1_3, x3_3, x2_3, x1_2, x3_2, x2_2, x1_1, x3_1, x2_1, x1_0, x3_0, x2_0, z_aux, a21_0, a31_0, a01_0, a12_0, a13_0) = polynomial_ring(
    QQ, 
    ["x1_8", "x1_7", "x3_7", "x2_7", "x1_6", "x3_6", "x2_6", "x1_5", "x3_5", "x2_5", "x1_4", "x3_4", "x2_4", "x1_3", "x3_3", "x2_3", "x1_2", "x3_2", "x2_2", "x1_1", "x3_1", "x2_1", "x1_0", "x3_0", "x2_0", "z_aux", "a21_0", "a31_0", "a01_0", "a12_0", "a13_0"], 
    ordering=:degrevlex
)
system = [
	-x1_0 + 434024366109,
	-x2_0^2*a12_0^2 - x3_0^2*a13_0^2 + x1_0*a21_0^2 + x1_0*a31_0^2 + x1_0*a01_0^2 + x1_1 - 541505024157,
	-x1_1 - 219046215227931218170031,
	-x2_1^2*a12_0^2 - x3_1^2*a13_0^2 + x1_1*a21_0^2 + x1_1*a31_0^2 + x1_1*a01_0^2 + x1_2 - 301827162049,
	x2_0^2*a12_0^2 - x1_0*a21_0^2 + x2_1^2,
	x3_0^2*a13_0^2 - x1_0*a31_0^2 + x3_1^2,
	-x1_2 + 375660505381519204864705036335383398,
	-x2_2^2*a12_0^2 - x3_2^2*a13_0^2 + x1_2*a21_0^2 + x1_2*a31_0^2 + x1_2*a01_0^2 + x1_3 - 104113352189,
	x2_1^2*a12_0^2 - x1_1*a21_0^2 + x2_2^2,
	x3_1^2*a13_0^2 - x1_1*a31_0^2 + x3_2^2,
	-x1_3 - 740433030759822846592604848464530490994198195952,
	-x2_3^2*a12_0^2 - x3_3^2*a13_0^2 + x1_3*a21_0^2 + x1_3*a31_0^2 + x1_3*a01_0^2 + x1_4 - 120490864443,
	x3_2^2*a13_0^2 - x1_2*a31_0^2 + x3_3^2,
	x2_2^2*a12_0^2 - x1_2*a21_0^2 + x2_3^2,
	-x1_4 + 1467875494455371019085162320406824703262326745475789459866208,
	-x2_4^2*a12_0^2 - x3_4^2*a13_0^2 + x1_4*a21_0^2 + x1_4*a31_0^2 + x1_4*a01_0^2 + x1_5 - 40061397281,
	x3_3^2*a13_0^2 - x1_3*a31_0^2 + x3_4^2,
	x2_3^2*a12_0^2 - x1_3*a21_0^2 + x2_4^2,
	-x1_5 - 2909496361262170128626149511789820580457822758026864582077260909321363764,
	-x2_5^2*a12_0^2 - x3_5^2*a13_0^2 + x1_5*a21_0^2 + x1_5*a31_0^2 + x1_5*a01_0^2 + x1_6 - 79461551039,
	x2_4^2*a12_0^2 - x1_4*a21_0^2 + x2_5^2,
	x3_4^2*a13_0^2 - x1_4*a31_0^2 + x3_5^2,
	-x1_6 + 5766090700280568086773650384414037170279853912817638455753735733886344385731604611864,
	-x2_6^2*a12_0^2 - x3_6^2*a13_0^2 + x1_6*a21_0^2 + x1_6*a31_0^2 + x1_6*a01_0^2 + x1_7 - 94547955276,
	x2_5^2*a12_0^2 - x1_5*a21_0^2 + x2_6^2,
	x3_5^2*a13_0^2 - x1_5*a31_0^2 + x3_6^2,
	-x1_7 - 11426750787029794239941794793739083944841747182242139199058357137080653852509995067695890113751037,
	-x2_7^2*a12_0^2 - x3_7^2*a13_0^2 + x1_7*a21_0^2 + x1_7*a31_0^2 + x1_7*a01_0^2 + x1_8 - 137146462481,
	x2_6^2*a12_0^2 - x1_6*a21_0^2 + x2_7^2,
	x3_6^2*a13_0^2 - x1_6*a31_0^2 + x3_7^2,
	-x1_8 + 22644197217908421130259832354747255989476952763516382082721582269537654642753777969638008088734932790094150119,
	z_aux - 1
]

