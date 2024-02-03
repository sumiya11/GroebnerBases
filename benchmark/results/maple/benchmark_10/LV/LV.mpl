# LV
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		-x1_0 + 1331213001,
		x2_0*x1_0*b_0 - x1_0*a_0 + x1_1,
		-x1_1 - 5931268592272293431844561,
		x1_1*x2_0*b_0 + x2_1*x1_0*b_0 - x1_1*a_0 + x1_2,
		-x2_0*x1_0*d_0 + x2_0*c_0 + x2_1,
		-x1_2 - 952189282510247647925743952540539693719579,
		2*x2_1*x1_1*b_0 + x1_2*x2_0*b_0 + x2_2*x1_0*b_0 - x1_2*a_0 + x1_3,
		-x1_1*x2_0*d_0 - x2_1*x1_0*d_0 + x2_1*c_0 + x2_2,
		-x1_3 - 144141262427335812053029767954139544317978338746774594746731,
		3*x1_2*x2_1*b_0 + 3*x2_2*x1_1*b_0 + x1_3*x2_0*b_0 + x2_3*x1_0*b_0 - x1_3*a_0 + x1_4,
		-2*x2_1*x1_1*d_0 - x1_2*x2_0*d_0 - x2_2*x1_0*d_0 + x2_2*c_0 + x2_3,
		-x1_4 - 18940127806265800771218984751739470848393226838001943566706573125393368768109,
		6*x2_2*x1_2*b_0 + 4*x1_3*x2_1*b_0 + 4*x2_3*x1_1*b_0 + x1_4*x2_0*b_0 + x2_4*x1_0*b_0 - x1_4*a_0 + x1_5,
		-3*x1_2*x2_1*d_0 - 3*x2_2*x1_1*d_0 - x1_3*x2_0*d_0 - x2_3*x1_0*d_0 + x2_3*c_0 + x2_4,
		-x1_5 - 1518651987837097589094104752725498771991508870611529367135838658350563010027414591107002247051,
		z_aux - 1
	]:
	print("Running LV");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(x1_5, x2_4, x1_4, x2_3, x1_3, x2_2, x1_2, x2_1, x1_1, x2_0, x1_0, z_aux, a_0, b_0, c_0, d_0), method=fgb, characteristic=0):
	print("LV: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_10/LV/timings":
FileTools[Text][WriteLine](timings_fn, "LV");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

