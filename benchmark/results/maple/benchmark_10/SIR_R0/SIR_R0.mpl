# SIR_R0
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		-In_0 + 7705071,
		-S_0*In_0*b_0 + In_0*g_0 + In_1,
		-aux_0*g_0 - b_0 + 6167398811020335/102875539*g_0,
		aux_1,
		-In_1 + 117184666353360996379374,
		-In_1*S_0*b_0 - S_1*In_0*b_0 + In_1*g_0 + In_2,
		S_0*In_0*b_0 + S_1,
		-In_2 + 1667940150551237254500531237472679364060,
		-2*S_1*In_1*b_0 - In_2*S_0*b_0 - S_2*In_0*b_0 + In_2*g_0 + In_3,
		In_1*S_0*b_0 + S_1*In_0*b_0 + S_2,
		-In_3 + 20263951257816904181089653240940855699600348876791441336,
		-3*In_2*S_1*b_0 - 3*S_2*In_1*b_0 - In_3*S_0*b_0 - S_3*In_0*b_0 + In_3*g_0 + In_4,
		2*S_1*In_1*b_0 + In_2*S_0*b_0 + S_2*In_0*b_0 + S_3,
		-In_4 + 139975279659547895314538465208485956514422610246551037434014653147727984,
		-aux_1*g_0,
		z_aux*g_0 - 1
	]:
	print("Running SIR_R0");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(In_4, S_3, In_3, S_2, In_2, aux_1, S_1, In_1, aux_0, S_0, In_0, z_aux, R_0, b_0, g_0), method=fgb, characteristic=0):
	print("SIR_R0: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_10/SIR_R0/timings":
FileTools[Text][WriteLine](timings_fn, "SIR_R0");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

