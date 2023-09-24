# reimer 7
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		2*x1^2 + 2147483645*x2^2 + 2*x3^2 + 2147483645*x4^2 + 2*x5^2 + 2147483645*x6^2 + 2*x7^2 + 2147483646,
		2*x1^3 + 2147483645*x2^3 + 2*x3^3 + 2147483645*x4^3 + 2*x5^3 + 2147483645*x6^3 + 2*x7^3 + 2147483646,
		2*x1^4 + 2147483645*x2^4 + 2*x3^4 + 2147483645*x4^4 + 2*x5^4 + 2147483645*x6^4 + 2*x7^4 + 2147483646,
		2*x1^5 + 2147483645*x2^5 + 2*x3^5 + 2147483645*x4^5 + 2*x5^5 + 2147483645*x6^5 + 2*x7^5 + 2147483646,
		2*x1^6 + 2147483645*x2^6 + 2*x3^6 + 2147483645*x4^6 + 2*x5^6 + 2147483645*x6^6 + 2*x7^6 + 2147483646,
		2*x1^7 + 2147483645*x2^7 + 2*x3^7 + 2147483645*x4^7 + 2*x5^7 + 2147483645*x6^7 + 2*x7^7 + 2147483646,
		2*x1^8 + 2147483645*x2^8 + 2*x3^8 + 2147483645*x4^8 + 2*x5^8 + 2147483645*x6^8 + 2*x7^8 + 2147483646
	]:
	print("Running reimer 7");
	st := time[real]():
	Groebner[Basis](J, tdeg(x1, x2, x3, x4, x5, x6, x7), method=fgb, characteristic=2147483647):
	print("reimer 7: ", time[real]() - st);
	runtime := min(runtime, time[real]() - st);
end do;

logs_fn := "/home/ademin/Groebner.jl/benchmark/arxiv_preprint/results/maple/benchmark_1/reimer 7/logs":
FileTools[Text][WriteLine](logs_fn, "reimer 7");
FileTools[Text][WriteLine](logs_fn, cat("total_time, ", String(runtime)));
