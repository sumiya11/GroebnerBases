# OralGlucose_with_weights
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		-Gb_0 + 118376518,
		Gb_1,
		-Ib_0 + 967675498,
		Ib_1,
		-G_0 + 352100454,
		X_0^2*G_0 - R_0^2*v_0 - Gb_0*p1_0 + G_0*p1_0 + G_1,
		-G_1 + 538342401306976850,
		G_1*X_0^2 + X_1^2*G_0 - R_1^2*v_0 - Gb_1*p1_0 + G_1*p1_0 + G_2,
		R_1^2 - k_0,
		X_0^2*p2_0^3 + Ib_0*p3_0^3 - 488757255*p3_0^3 + X_1^2,
		-G_2 - 768105020437324237049432610,
		2*X_1^2*G_1 + G_2*X_0^2 + X_2^2*G_0 - R_2^2*v_0 - Gb_2*p1_0 + G_2*p1_0 + G_3,
		X_1^2*p2_0^3 + Ib_1*p3_0^3 - 1072781344*p3_0^3 + X_2^2,
		Gb_2,
		R_2^2,
		-G_3 + 1859433685815550953007403242183639336,
		3*G_2*X_1^2 + 3*X_2^2*G_1 + G_3*X_0^2 + X_3^2*G_0 - R_3^2*v_0 - Gb_3*p1_0 + G_3*p1_0 + G_4,
		X_2^2*p2_0^3 + Ib_2*p3_0^3 - 779275566*p3_0^3 + X_3^2,
		Gb_3,
		R_3^2,
		Ib_2,
		-G_4 - 5019118966117076820897474250337682102261294150,
		6*X_2^2*G_2 + 4*G_3*X_1^2 + 4*X_3^2*G_1 + G_4*X_0^2 + X_4^2*G_0 - R_4^2*v_0 - Gb_4*p1_0 + G_4*p1_0 + G_5,
		Gb_4,
		R_4^2,
		X_3^2*p2_0^3 + Ib_3*p3_0^3 - 1050895319*p3_0^3 + X_4^2,
		Ib_3,
		-G_5 + 14771554172800251393575141005132062618327420107470422668,
		10*G_3*X_2^2 + 10*X_3^2*G_2 + 5*G_4*X_1^2 + 5*X_4^2*G_1 + G_5*X_0^2 + X_5^2*G_0 - R_5^2*v_0 - Gb_5*p1_0 + G_5*p1_0 + G_6,
		Gb_5,
		R_5^2,
		X_4^2*p2_0^3 + Ib_4*p3_0^3 - 11191147*p3_0^3 + X_5^2,
		Ib_4,
		-G_6 - 47289247981594598345494945199478950253275823155393178965266561962,
		20*X_3^2*G_3 + 15*G_4*X_2^2 + 15*X_4^2*G_2 + 6*G_5*X_1^2 + 6*X_5^2*G_1 + G_6*X_0^2 + X_6^2*G_0 - R_6^2*v_0 - Gb_6*p1_0 + G_6*p1_0 + G_7,
		X_5^2*p2_0^3 + Ib_5*p3_0^3 - 851251313*p3_0^3 + X_6^2,
		Gb_6,
		R_6^2,
		Ib_5,
		-Gb_1,
		-Gb_2,
		-Gb_3,
		-Gb_4,
		-Gb_5,
		-Gb_6,
		-Ib_1,
		-Ib_2,
		-Ib_3,
		-Ib_4,
		-Ib_5,
		-G_7 + 163226896576969998501533779290770586312417796335402948674730631682224988680,
		z_aux - 1
	]:
	print("Running OralGlucose_with_weights");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(G_7, X_6, Gb_6, G_6, R_6, Ib_5, X_5, Gb_5, G_5, R_5, Ib_4, X_4, Gb_4, G_4, R_4, Ib_3, X_3, Gb_3, G_3, R_3, Ib_2, X_2, Gb_2, G_2, R_2, Ib_1, X_1, Gb_1, G_1, R_1, Ib_0, X_0, Gb_0, G_0, R_0, z_aux, p1_0, v_0, p2_0, p3_0, k_0), method=fgb, characteristic=0):
	print("OralGlucose_with_weights: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_10/OralGlucose_with_weights/timings":
FileTools[Text][WriteLine](timings_fn, "OralGlucose_with_weights");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

