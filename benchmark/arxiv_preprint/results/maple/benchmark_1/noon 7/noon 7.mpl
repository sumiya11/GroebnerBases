# noon 7
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		10*x1*x2^2 + 10*x1*x3^2 + 10*x1*x4^2 + 10*x1*x5^2 + 10*x1*x6^2 + 10*x1*x7^2 + 2147483636*x1 + 10,
		10*x1^2*x2 + 10*x2*x3^2 + 10*x2*x4^2 + 10*x2*x5^2 + 10*x2*x6^2 + 10*x2*x7^2 + 2147483636*x2 + 10,
		10*x1^2*x3 + 10*x2^2*x3 + 10*x3*x4^2 + 10*x3*x5^2 + 10*x3*x6^2 + 10*x3*x7^2 + 2147483636*x3 + 10,
		10*x1^2*x4 + 10*x2^2*x4 + 10*x3^2*x4 + 10*x4*x5^2 + 10*x4*x6^2 + 10*x4*x7^2 + 2147483636*x4 + 10,
		10*x1^2*x5 + 10*x2^2*x5 + 10*x3^2*x5 + 10*x4^2*x5 + 10*x5*x6^2 + 10*x5*x7^2 + 2147483636*x5 + 10,
		10*x1^2*x6 + 10*x2^2*x6 + 10*x3^2*x6 + 10*x4^2*x6 + 10*x5^2*x6 + 10*x6*x7^2 + 2147483636*x6 + 10,
		10*x1^2*x7 + 10*x2^2*x7 + 10*x3^2*x7 + 10*x4^2*x7 + 10*x5^2*x7 + 10*x6^2*x7 + 2147483636*x7 + 10
	]:
	print("Running noon 7");
	st := time[real]():
	Groebner[Basis](J, tdeg(x1, x2, x3, x4, x5, x6, x7), method=fgb, characteristic=2147483647):
	print("noon 7: ", time[real]() - st);
	runtime := min(runtime, time[real]() - st);
end do;

timings_fn := "/home/ademin/Groebner.jl/benchmark/arxiv_preprint/results/maple/benchmark_1/noon 7/timings":
FileTools[Text][WriteLine](timings_fn, "noon 7");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime)));
