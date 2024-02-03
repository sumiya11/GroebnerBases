# OralGlucose
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		-Gb_0 + 731370460,
		Gb_1,
		-Ib_0 + 718825419,
		Ib_1,
		-G_0 + 667799210,
		X_0*G_0 - Gb_0*p1_0 + G_0*p1_0 - R_0*v_0 + G_1,
		-G_1 + 750342291751372038,
		G_1*X_0 + X_1*G_0 - Gb_1*p1_0 + G_1*p1_0 - R_1*v_0 + G_2,
		R_1 - k_0,
		X_0*p2_0 + Ib_0*p3_0 + X_1 - 91341815*p3_0,
		-G_2 + 2475651690220785915964264,
		2*X_1*G_1 + G_2*X_0 + X_2*G_0 - Gb_2*p1_0 + G_2*p1_0 - R_2*v_0 + G_3,
		X_1*p2_0 + Ib_1*p3_0 + X_2 - 241177193*p3_0,
		Gb_2,
		R_2,
		-G_3 + 342162863685734672137025294862975782,
		3*G_2*X_1 + 3*X_2*G_1 + G_3*X_0 + X_3*G_0 - Gb_3*p1_0 + G_3*p1_0 - R_3*v_0 + G_4,
		X_2*p2_0 + Ib_2*p3_0 + X_3 - 210594226*p3_0,
		Gb_3,
		R_3,
		Ib_2,
		-G_4 - 385459877363434577369830031644990382352424540,
		6*X_2*G_2 + 4*G_3*X_1 + 4*X_3*G_1 + G_4*X_0 + X_4*G_0 - Gb_4*p1_0 + G_4*p1_0 - R_4*v_0 + G_5,
		Gb_4,
		R_4,
		X_3*p2_0 + Ib_3*p3_0 + X_4 - 933212820*p3_0,
		Ib_3,
		-G_5 + 725503448275746189561987592001413074855834832895223370,
		10*G_3*X_2 + 10*X_3*G_2 + 5*G_4*X_1 + 5*X_4*G_1 + G_5*X_0 + X_5*G_0 - Gb_5*p1_0 + G_5*p1_0 - R_5*v_0 + G_6,
		Gb_5,
		R_5,
		X_4*p2_0 + Ib_4*p3_0 + X_5 - 881484771*p3_0,
		Ib_4,
		-G_6 - 1447128028102559522020212946352081005649181057302285933731494280,
		20*X_3*G_3 + 15*G_4*X_2 + 15*X_4*G_2 + 6*G_5*X_1 + 6*X_5*G_1 + G_6*X_0 + X_6*G_0 - Gb_6*p1_0 + G_6*p1_0 - R_6*v_0 + G_7,
		X_5*p2_0 + Ib_5*p3_0 + X_6 - 144144427*p3_0,
		Gb_6,
		R_6,
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
		-G_7 + 3242047659224215435784394450671786217455166816963602791656642459393121710,
		z_aux - 1
	]:
	print("Running OralGlucose");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(G_7, X_6, Gb_6, G_6, R_6, Ib_5, X_5, Gb_5, G_5, R_5, Ib_4, X_4, Gb_4, G_4, R_4, Ib_3, X_3, Gb_3, G_3, R_3, Ib_2, X_2, Gb_2, G_2, R_2, Ib_1, X_1, Gb_1, G_1, R_1, Ib_0, X_0, Gb_0, G_0, R_0, z_aux, p1_0, v_0, p2_0, p3_0, k_0), method=fgb, characteristic=0):
	print("OralGlucose: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_10/OralGlucose/timings":
FileTools[Text][WriteLine](timings_fn, "OralGlucose");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

