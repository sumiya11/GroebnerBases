# hexapod
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		1000000*t1^2*a^2 + 1000000*t2^2*a^2 + 1000000*t3^2*a^2 + 1000000*t1^2*b^2 + 1000000*t2^2*b^2 + 1000000*t3^2*b^2 + 1000000*t1^2*c^2 + 1000000*t2^2*c^2 + 1000000*t3^2*c^2 - 1065102000*t1*a^2 - 1566200000*t2*a^2 + 359610000*t3*a^2 - 4000000*t2*a*b - 1574352000*t3*a*b - 1065102000*t1*b^2 + 8152000*t2*b^2 + 355610000*t3*b^2 + 4000000*t1*a*c + 273640000*t3*a*c - 1574352000*t1*b*c - 273640000*t2*b*c - 791462000*t1*c^2 - 1566200000*t2*c^2 + 355610000*t3*c^2 + 1000000*t1^2 + 1000000*t2^2 + 1000000*t3^2 + 1574352000*t1*a - 273640000*t2*a + 740236705137*a^2 + 4000000*t1*b - 273640000*t3*b - 279943961360*a*b + 126292488913*b^2 + 4000000*t2*c - 1574352000*t3*c + 47071636200*a*c + 837307375312*b*c + 612513941897*c^2 - 791462000*t1 + 8152000*t2 + 359610000*t3 - 624135247952*a - 50784764200*b - 283060057360*c + 165673,
		1000000*t1^2*a^2 + 1000000*t2^2*a^2 + 1000000*t3^2*a^2 + 1000000*t1^2*b^2 + 1000000*t2^2*b^2 + 1000000*t3^2*b^2 + 1000000*t1^2*c^2 + 1000000*t2^2*c^2 + 1000000*t3^2*c^2 - 1889130000*t1*a^2 - 139016000*t2*a^2 + 357608000*t3*a^2 + 550492000*t3*a*b - 1889130000*t1*b^2 - 689508000*t2*b^2 + 357608000*t3*b^2 + 1500376000*t3*a*c + 550492000*t1*b*c - 1500376000*t2*b*c - 388754000*t1*c^2 - 139016000*t2*c^2 + 357608000*t3*c^2 + 1000000*t1^2 + 1000000*t2^2 + 1000000*t3^2 - 550492000*t1*a - 1500376000*t2*a + 740396599024*a^2 - 1500376000*t3*b + 98430171568*a*b + 854420557476*b^2 + 550492000*t3*c + 268273230304*a*c - 2714848476*b*c - 114024022072*c^2 - 388754000*t1 - 689508000*t2 + 357608000*t3 + 624263610988*a - 268273230304*b + 98430171568*c - 63620,
		4000000*t1^2*a^2 + 4000000*t2^2*a^2 + 4000000*t3^2*a^2 + 4000000*t1^2*b^2 + 4000000*t2^2*b^2 + 4000000*t3^2*b^2 + 4000000*t1^2*c^2 + 4000000*t2^2*c^2 + 4000000*t3^2*c^2 - 3295636000*t1*a^2 + 6825304000*t2*a^2 + 1438448000*t3*a^2 - 16000000*t2*a*b + 4096192000*t3*a*b - 3295636000*t1*b^2 + 2729112000*t2*b^2 + 1422448000*t3*b^2 + 16000000*t1*a*c + 4906624000*t3*a*c + 4096192000*t1*b*c - 4906624000*t2*b*c + 1610988000*t1*c^2 + 6825304000*t2*c^2 + 1422448000*t3*c^2 + 4000000*t1^2 + 4000000*t2^2 + 4000000*t3^2 - 4096192000*t1*a - 4906624000*t2*a + 2962666483625*a^2 + 16000000*t1*b - 4906624000*t3*b + 722869290752*a*b + 513760438633*b^2 + 16000000*t2*c + 4096192000*t3*c + 875649162944*a*c - 3361285532000*b*c + 2443184693353*c^2 + 1610988000*t1 + 2729112000*t2 + 1438448000*t3 - 2498705324448*a - 879018458944*b + 741978122752*c + 440361,
		4000000*t1^2*a^2 + 4000000*t2^2*a^2 + 4000000*t3^2*a^2 + 4000000*t1^2*b^2 + 4000000*t2^2*b^2 + 4000000*t3^2*b^2 + 4000000*t1^2*c^2 + 4000000*t2^2*c^2 + 4000000*t3^2*c^2 + 3295636000*t1*a^2 + 6824896000*t2*a^2 + 1430432000*t3*a^2 + 4094592000*t3*a*b + 3295636000*t1*b^2 + 2730304000*t2*b^2 + 1430432000*t3*b^2 - 4906624000*t3*a*c + 4094592000*t1*b*c + 4906624000*t2*b*c - 1610988000*t1*c^2 + 6824896000*t2*c^2 + 1430432000*t3*c^2 + 4000000*t1^2 + 4000000*t2^2 + 4000000*t3^2 - 4094592000*t1*a + 4906624000*t2*a + 2961910911797*a^2 + 4906624000*t3*b + 732129427968*a*b + 516620569397*b^2 + 4094592000*t3*c - 877323997696*a*c + 3361357491776*b*c + 2445290017525*c^2 - 1610988000*t1 + 2730304000*t2 + 1430432000*t3 + 2499114213824*a + 877323997696*b + 732129427968*c - 324875,
		1000000*t1^2*a^2 + 1000000*t2^2*a^2 + 1000000*t3^2*a^2 + 1000000*t1^2*b^2 + 1000000*t2^2*b^2 + 1000000*t3^2*b^2 + 1000000*t1^2*c^2 + 1000000*t2^2*c^2 + 1000000*t3^2*c^2 + 1889602000*t1*a^2 - 138926000*t2*a^2 + 359604000*t3*a^2 - 4000000*t2*a*b + 550036000*t3*a*b + 1889602000*t1*b^2 - 688962000*t2*b^2 + 355604000*t3*b^2 + 4000000*t1*a*c - 1500228000*t3*a*c + 550036000*t1*b*c + 1500228000*t2*b*c + 389374000*t1*c^2 - 138926000*t2*c^2 + 355604000*t3*c^2 + 1000000*t1^2 + 1000000*t2^2 + 1000000*t3^2 - 550036000*t1*a + 1500228000*t2*a + 740903906549*a^2 + 4000000*t1*b + 1500228000*t3*b + 99175424872*a*b + 854030749541*b^2 + 4000000*t2*c + 550036000*t3*c - 265964790856*a*c + 2874521168*b*c - 114557203083*c^2 + 389374000*t1 - 688962000*t2 + 359604000*t3 - 623884900400*a + 270522742856*b + 97519648872*c + 55909,
		250000*t1^2*a^2 + 250000*t2^2*a^2 + 250000*t3^2*a^2 + 250000*t1^2*b^2 + 250000*t2^2*b^2 + 250000*t3^2*b^2 + 250000*t1^2*c^2 + 250000*t2^2*c^2 + 250000*t3^2*c^2 + 266341000*t1*a^2 - 391502000*t2*a^2 + 89402000*t3*a^2 - 393620000*t3*a*b + 266341000*t1*b^2 + 2118000*t2*b^2 + 89402000*t3*b^2 - 68228000*t3*a*c - 393620000*t1*b*c + 68228000*t2*b*c + 198113000*t1*c^2 - 391502000*t2*c^2 + 89402000*t3*c^2 + 250000*t1^2 + 250000*t2^2 + 250000*t3^2 + 393620000*t1*a + 68228000*t2*a + 184958257568*a^2 + 68228000*t3*b - 70380830480*a*b + 31688927488*b^2 - 393620000*t3*c - 12199439312*a*c - 209385275032*b*c + 153269490056*c^2 + 198113000*t1 + 2118000*t2 + 89402000*t3 + 156251491928*a + 12199439312*b - 70380830480*c + 159976
	]:
	print("Running hexapod");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(t1, t2, t3, a, b, c), method=fgb, characteristic=0):
	print("hexapod: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_11/hexapod/timings":
FileTools[Text][WriteLine](timings_fn, "hexapod");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

