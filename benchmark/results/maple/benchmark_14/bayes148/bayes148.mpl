# bayes148
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		x24*x31 + 1073741826*x23*x32,
		x24*x30 + 1073741826*x22*x32,
		x23*x30 + 1073741826*x22*x31,
		x24*x29 + 1073741826*x21*x32,
		x23*x29 + 1073741826*x21*x31,
		x22*x29 + 1073741826*x21*x30,
		x16*x28 + 1073741826*x12*x32,
		x20*x27 + 1073741826*x19*x28,
		x15*x27 + 1073741826*x11*x31,
		x20*x26 + 1073741826*x18*x28,
		x19*x26 + 1073741826*x18*x27,
		x14*x26 + 1073741826*x10*x30,
		x20*x25 + 1073741826*x17*x28,
		x19*x25 + 1073741826*x17*x27,
		x18*x25 + 1073741826*x17*x26,
		x13*x25 + 1073741826*x9*x29,
		x8*x20 + 1073741826*x4*x24,
		x18*x19 + 1073741826*x17*x20 + 1073741826*x20*x21 + x19*x22 + x18*x23 + x22*x23 + 1073741826*x17*x24 + 1073741826*x21*x24 + 1073741826*x24*x25 + x23*x26 + 2*x18*x27 + x22*x27 + x26*x27 + 1073741825*x17*x28 + 1073741826*x21*x28 + 1073741826*x25*x28 + 1073741826*x20*x29 + 1073741826*x28*x29 + x19*x30 + x27*x30 + x18*x31 + 2*x22*x31 + x26*x31 + x30*x31 + 1073741826*x17*x32 + 1073741825*x21*x32 + 1073741826*x25*x32 + 1073741826*x29*x32,
		x7*x19 + 1073741826*x3*x23,
		x6*x18 + 1073741826*x2*x22,
		x5*x17 + 1073741826*x1*x21
	]:
	print("Running bayes148");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32), method=fgb, characteristic=1073741827):
	print("bayes148: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_14/bayes148/timings":
FileTools[Text][WriteLine](timings_fn, "bayes148");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

output_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_14/bayes148//output":
FileTools[Text][WriteLine](output_fn, "x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32");
FileTools[Text][WriteLine](output_fn, "1073741827");
for poly in G do
    FileTools[Text][WriteLine](output_fn, cat(String(poly), ",")):
end do:


