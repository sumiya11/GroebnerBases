# SEIR
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		-In_0 + 37298982837,
		-E_0*nu_0 + In_0*a_0 + In_1,
		-N_0 + 204172375424,
		N_1,
		-In_1 - 142111538332323332760,
		-E_1*nu_0 + In_1*a_0 + In_2,
		-S_0*In_0*b_0 + N_0*E_0*nu_0 + E_1*N_0,
		-In_2 - 7235633977025624569902113484396699435553827/25521546928,
		-E_2*nu_0 + In_2*a_0 + In_3,
		-In_1*S_0*b_0 - S_1*In_0*b_0 + E_1*N_0*nu_0 + N_1*E_0*nu_0 + N_1*E_1 + E_2*N_0,
		S_0*In_0*b_0 + S_1*N_0,
		-In_3 + 398022993509844569624546660667954684535370020300297732258159207155/5210794860784849897472,
		-E_3*nu_0 + In_3*a_0 + In_4,
		-2*S_1*In_1*b_0 - In_2*S_0*b_0 - S_2*In_0*b_0 + 2*N_1*E_1*nu_0 + E_2*N_0*nu_0 + N_2*E_0*nu_0 + 2*E_2*N_1 + N_2*E_1 + E_3*N_0,
		In_1*S_0*b_0 + S_1*In_0*b_0 + S_1*N_1 + S_2*N_0,
		N_2,
		-In_4 - 19075627957098453555840296836745443027285845612426385192048999599257875221680203223861763/1063900364573614188558141092528128,
		-E_4*nu_0 + In_4*a_0 + In_5,
		-3*In_2*S_1*b_0 - 3*S_2*In_1*b_0 - In_3*S_0*b_0 - S_3*In_0*b_0 + 3*E_2*N_1*nu_0 + 3*N_2*E_1*nu_0 + E_3*N_0*nu_0 + N_3*E_0*nu_0 + 3*N_2*E_2 + 3*E_3*N_1 + N_3*E_1 + E_4*N_0,
		N_3,
		2*S_1*In_1*b_0 + In_2*S_0*b_0 + S_2*In_0*b_0 + N_2*S_1 + 2*S_2*N_1 + S_3*N_0,
		-In_5 + 899675782943334494918319693548433351602497059968838159489989048209168026644225407759661255036540987302686331923/217219064649454425790825908395214471295926272,
		-E_5*nu_0 + In_5*a_0 + In_6,
		-6*S_2*In_2*b_0 - 4*In_3*S_1*b_0 - 4*S_3*In_1*b_0 - In_4*S_0*b_0 - S_4*In_0*b_0 + 6*N_2*E_2*nu_0 + 4*E_3*N_1*nu_0 + 4*N_3*E_1*nu_0 + E_4*N_0*nu_0 + N_4*E_0*nu_0 + 6*E_3*N_2 + 4*N_3*E_2 + 4*E_4*N_1 + N_4*E_1 + E_5*N_0,
		3*In_2*S_1*b_0 + 3*S_2*In_1*b_0 + In_3*S_0*b_0 + S_3*In_0*b_0 + 3*S_2*N_2 + N_3*S_1 + 3*S_3*N_1 + S_4*N_0,
		N_4,
		-In_6 - 42423836883653525612488699466941415560600272506743424330804406724858378569832474135855968499089220905166331390246783187616120884191523/44350132416858535979342855463893562398429530608608739328,
		-N_1,
		-N_2,
		-N_3,
		-N_4,
		N_0*z_aux - 1
	]:
	print("Running SEIR");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(In_6, In_5, E_5, S_4, N_4, In_4, E_4, S_3, N_3, In_3, E_3, S_2, N_2, In_2, E_2, S_1, N_1, In_1, E_1, S_0, N_0, In_0, E_0, z_aux, b_0, nu_0, a_0), method=fgb, characteristic=0):
	print("SEIR: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_10/SEIR/timings":
FileTools[Text][WriteLine](timings_fn, "SEIR");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

