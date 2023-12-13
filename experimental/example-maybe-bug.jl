using AbstractAlgebra, BenchmarkTools # , Groebner

R, (x1, x2, x3) = PolynomialRing(GF(2^27 + 29), ["x1", "x2", "x3"], ordering=:degrevlex)
R, (x1, x2, x3) = PolynomialRing(GF(2^31 - 1), ["x1", "x2", "x3"], ordering=:degrevlex)

s = [x1 * x2^5 + 2, x1^3 * x3 + 3, x2^2 * x3^3 + 4 * x1^4 - 5]
gb1 = Groebner.groebner(
    s,
    loglevel=-5,
    linalg=:deterministic,
    threaded=:yes,
    threadalgo=:lock_free,
    nworkers=3
);
gb2 = Groebner.groebner(
    s,
    loglevel=-5,
    linalg=:deterministic,
    threaded=:yes,
    threadalgo=:compare_and_swap,
    nworkers=3
);
gb3 = Groebner.groebner(s, loglevel=-5, linalg=:deterministic, threaded=:no);
gb1 == gb2 == gb3

p1 = 2^31 - 1
p2 = 2^29 + 11
p3 = 2^27 + 29
p4 = 2^25 + 35
s = Groebner.katsuran(10, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))

Groebner.logging_enabled() = false
Groebner.invariants_enabled() = false
@time gb1 = Groebner.groebner(
    s,
    linalg=:deterministic,
    threaded=:yes,
    threadalgo=:compare_and_swap,
    loglevel=0,
    nworkers=1
);
@time gb2 = Groebner.groebner(s, loglevel=0, linalg=:deterministic, threaded=:no);
gb1 == gb2

BenchmarkTools.DEFAULT_PARAMETERS.samples = 3
systems = [
    ("kat7", Groebner.katsuran(7, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("kat8", Groebner.katsuran(8, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("kat9", Groebner.katsuran(9, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("kat10", Groebner.katsuran(10, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("cyc6", Groebner.cyclicn(6, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("cyc7", Groebner.cyclicn(7, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("cyc8", Groebner.cyclicn(8, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("eco10", Groebner.eco10(ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("eco11", Groebner.eco11(ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("eco12", Groebner.eco12(ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("noon6", Groebner.noonn(6, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2))),
    ("noon7", Groebner.noonn(7, ordering=:degrevlex, ground=AbstractAlgebra.GF(p2)))
]
for (name, s) in systems
    @info "$name: lock_free / compare_and_swap / single_thread"
    gb1 = @btime Groebner.groebner(
        $s,
        linalg=:deterministic,
        threaded=:yes,
        loglevel=0,
        threadalgo=:lock_free
    )
    gb2 = @btime Groebner.groebner(
        $s,
        linalg=:deterministic,
        threaded=:yes,
        loglevel=0,
        threadalgo=:compare_and_swap
    )
    gb3 = @btime Groebner.groebner($s, loglevel=0, linalg=:deterministic, threaded=:no)
    @assert gb1 == gb2 == gb3
end

@time trace, gb2 = Groebner.groebner_learn(s);

@btime suc, gb3 = Groebner.groebner_apply!($trace, $s);

println()
ground = AbstractAlgebra.GF(1048583)
run_f4_ff_degrevlex_benchmarks(ground)
# for k = 7
# 188.876 ms (213205 allocations: 42.44 MiB)

#! format: off
R,(t1,t2,t3,a,b,c) = PolynomialRing(GF(2^27+29), ["t1","t2","t3","a", "b", "c"], ordering=:degrevlex)
sys = [1000000*a^2*t1^2+1000000*a^2*t2^2+1000000*a^2*t3^2+1000000*b^2*t1^2+1000000*b^2*t2^2+1000000*b^2*t3^2+1000000*c^2*t1^2+1000000*c^2*t2^2+1000000*c^2*t3^2-1065102000*a^2*t1-1566200000*a^2*t2+359610000*a^2*t3-4000000*a*b*t2-1574352000*a*b*t3+4000000*a*c*t1+273640000*a*c*t3-1065102000*b^2*t1+8152000*b^2*t2+355610000*b^2*t3-1574352000*b*c*t1-273640000*b*c*t2-791462000*c^2*t1-1566200000*c^2*t2+355610000*c^2*t3+740236705137*a^2-279943961360*a*b+47071636200*a*c+1574352000*a*t1-273640000*a*t2+126292488913*b^2+837307375312*b*c+4000000*b*t1-273640000*b*t3+612513941897*c^2+4000000*c*t2-1574352000*c*t3+1000000*t1^2+1000000*t2^2+1000000*t3^2-624135247952*a-50784764200*b-283060057360*c-791462000*t1+8152000*t2+359610000*t3+165673, 1000000*a^2*t1^2+1000000*a^2*t2^2+1000000*a^2*t3^2+1000000*b^2*t1^2+1000000*b^2*t2^2+1000000*b^2*t3^2+1000000*c^2*t1^2+1000000*c^2*t2^2+1000000*c^2*t3^2-1889130000*a^2*t1-139016000*a^2*t2+357608000*a^2*t3+550492000*a*b*t3+1500376000*a*c*t3-1889130000*b^2*t1-689508000*b^2*t2+357608000*b^2*t3+550492000*b*c*t1-1500376000*b*c*t2-388754000*c^2*t1-139016000*c^2*t2+357608000*c^2*t3+740396599024*a^2+98430171568*a*b+268273230304*a*c-550492000*a*t1-1500376000*a*t2+854420557476*b^2-2714848476*b*c-1500376000*b*t3-114024022072*c^2+550492000*c*t3+1000000*t1^2+1000000*t2^2+1000000*t3^2+624263610988*a-268273230304*b+98430171568*c-388754000*t1-689508000*t2+357608000*t3-63620, 4000000*a^2*t1^2+4000000*a^2*t2^2+4000000*a^2*t3^2+4000000*b^2*t1^2+4000000*b^2*t2^2+4000000*b^2*t3^2+4000000*c^2*t1^2+4000000*c^2*t2^2+4000000*c^2*t3^2-3295636000*a^2*t1+6825304000*a^2*t2+1438448000*a^2*t3-16000000*a*b*t2+4096192000*a*b*t3+16000000*a*c*t1+4906624000*a*c*t3-3295636000*b^2*t1+2729112000*b^2*t2+1422448000*b^2*t3+4096192000*b*c*t1-4906624000*b*c*t2+1610988000*c^2*t1+6825304000*c^2*t2+1422448000*c^2*t3+2962666483625*a^2+722869290752*a*b+875649162944*a*c-4096192000*a*t1-4906624000*a*t2+513760438633*b^2-3361285532000*b*c+16000000*b*t1-4906624000*b*t3+2443184693353*c^2+16000000*c*t2+4096192000*c*t3+4000000*t1^2+4000000*t2^2+4000000*t3^2-2498705324448*a-879018458944*b+741978122752*c+1610988000*t1+2729112000*t2+1438448000*t3+440361,4000000*a^2*t1^2+4000000*a^2*t2^2+4000000*a^2*t3^2+4000000*b^2*t1^2+4000000*b^2*t2^2+4000000*b^2*t3^2+4000000*c^2*t1^2+4000000*c^2*t2^2+4000000*c^2*t3^2+3295636000*a^2*t1+6824896000*a^2*t2+1430432000*a^2*t3+4094592000*a*b*t3-4906624000*a*c*t3+3295636000*b^2*t1+2730304000*b^2*t2+1430432000*b^2*t3+4094592000*b*c*t1+4906624000*b*c*t2-1610988000*c^2*t1+6824896000*c^2*t2+1430432000*c^2*t3+2961910911797*a^2+732129427968*a*b-877323997696*a*c-4094592000*a*t1+4906624000*a*t2+516620569397*b^2+3361357491776*b*c+4906624000*b*t3+2445290017525*c^2+4094592000*c*t3+4000000*t1^2+4000000*t2^2+4000000*t3^2+2499114213824*a+877323997696*b+732129427968*c-1610988000*t1+2730304000*t2+1430432000*t3-324875, 1000000*a^2*t1^2+1000000*a^2*t2^2+1000000*a^2*t3^2+1000000*b^2*t1^2+1000000*b^2*t2^2+1000000*b^2*t3^2+1000000*c^2*t1^2+1000000*c^2*t2^2+1000000*c^2*t3^2+1889602000*a^2*t1-138926000*a^2*t2+359604000*a^2*t3-4000000*a*b*t2+550036000*a*b*t3+4000000*a*c*t1-1500228000*a*c*t3+1889602000*b^2*t1-688962000*b^2*t2+355604000*b^2*t3+550036000*b*c*t1+1500228000*b*c*t2+389374000*c^2*t1-138926000*c^2*t2+355604000*c^2*t3+740903906549*a^2+99175424872*a*b-265964790856*a*c-550036000*a*t1+1500228000*a*t2+854030749541*b^2+2874521168*b*c+4000000*b*t1+1500228000*b*t3-114557203083*c^2+4000000*c*t2+550036000*c*t3+1000000*t1^2+1000000*t2^2+1000000*t3^2-623884900400*a+270522742856*b+97519648872*c+389374000*t1-688962000*t2+359604000*t3+55909, 250000*a^2*t1^2+250000*a^2*t2^2+250000*a^2*t3^2+250000*b^2*t1^2+250000*b^2*t2^2+250000*b^2*t3^2+250000*c^2*t1^2+250000*c^2*t2^2+250000*c^2*t3^2+266341000*a^2*t1-391502000*a^2*t2+89402000*a^2*t3-393620000*a*b*t3-68228000*a*c*t3+266341000*b^2*t1+2118000*b^2*t2+89402000*b^2*t3-393620000*b*c*t1+68228000*b*c*t2+198113000*c^2*t1-391502000*c^2*t2+89402000*c^2*t3+184958257568*a^2-70380830480*a*b-12199439312*a*c+393620000*a*t1+68228000*a*t2+31688927488*b^2-209385275032*b*c+68228000*b*t3+153269490056*c^2-393620000*c*t3+250000*t1^2+250000*t2^2+250000*t3^2+156251491928*a+12199439312*b-70380830480*c+198113000*t1+2118000*t2+89402000*t3+159976]

@time trace, gb = Groebner.groebner_learn(
    sys,
    ordering=Groebner.DegRevLex(),
);

gb = Groebner.groebner_apply!(
    trace,
    sys,
    loglevel=-3
);

#! format: on

Groebner.performance_counters_enabled() = true
@time gb = Groebner.groebner(
    sys,
    ordering=Groebner.DegRevLex(),
    statistics=:timings,
    modular=:learn_and_apply
);

Groebner.isgroebner(gb, ordering=Groebner.DegRevLex())
Groebner.normalform(gb, sys, ordering=Groebner.DegRevLex())

using BenchmarkTools
Groebner.invariants_enabled() = false
Groebner.logging_enabled() = false
Groebner.performance_counters_enabled() = false
k = Groebner.katsuran(10, ground=GF(2^30 + 3), ordering=:degrevlex)
@btime Groebner.groebner($k);
