# ChemicalReactionNetwork_with_weights
with(Groebner):
with(PolynomialIdeals):
kernelopts(numcpus=1);

runtime := 2^1000:
for i from 1 by 1 to 1 do
	J := [
		-x2_0 + 482235206990389764253,
		-x2_0*x1_0^2*k1_0 - x4_0^2*k2_0 - x4_0^2*k3_0 + x2_1,
		-x3_0 + 356215508333881463537,
		x5_0^2*x3_0*k6_0 - x4_0^2*k3_0 - x6_0^2*k5_0 + x3_1,
		-x2_1 + 12064789604199819673625228655158964185575969546418727977760856,
		-x1_1^2*x2_0*k1_0 - x2_1*x1_0^2*k1_0 - x4_1^2*k2_0 - x4_1^2*k3_0 + x2_2,
		-x2_0*x1_0^2*k1_0 + x4_0^2*k2_0 + x4_0^2*k3_0 + x4_1^2,
		-x6_0^2*k4_0^3 + x2_0*x1_0^2*k1_0 - x4_0^2*k2_0 + x1_1^2,
		-x3_1 - 5104589707293223584571682941300729850998717918632432891809793,
		x3_1*x5_0^2*k6_0 + x5_1^2*x3_0*k6_0 - x4_1^2*k3_0 - x6_1^2*k5_0 + x3_2,
		x6_0^2*k4_0^3 - x5_0^2*x3_0*k6_0 + x6_0^2*k5_0 + x6_1^2,
		-x6_0^2*k4_0^3 + x5_0^2*x3_0*k6_0 - x6_0^2*k5_0 + x5_1^2,
		-x2_2 - 1375314612540449198717595937730259442734912468244413528358702813657274890597821476884620346551240723024,
		-2*x2_1*x1_1^2*k1_0 - x1_2^2*x2_0*k1_0 - x2_2*x1_0^2*k1_0 - x4_2^2*k2_0 - x4_2^2*k3_0 + x2_3,
		-x1_1^2*x2_0*k1_0 - x2_1*x1_0^2*k1_0 + x4_1^2*k2_0 + x4_1^2*k3_0 + x4_2^2,
		-x6_1^2*k4_0^3 + x1_1^2*x2_0*k1_0 + x2_1*x1_0^2*k1_0 - x4_1^2*k2_0 + x1_2^2,
		-x3_2 + 244088181626744510448326561667050903381260608586379744353631858091989657990842240929744583398174608495,
		2*x5_1^2*x3_1*k6_0 + x3_2*x5_0^2*k6_0 + x5_2^2*x3_0*k6_0 - x4_2^2*k3_0 - x6_2^2*k5_0 + x3_3,
		-x6_1^2*k4_0^3 + x3_1*x5_0^2*k6_0 + x5_1^2*x3_0*k6_0 - x6_1^2*k5_0 + x5_2^2,
		x6_1^2*k4_0^3 - x3_1*x5_0^2*k6_0 - x5_1^2*x3_0*k6_0 + x6_1^2*k5_0 + x6_2^2,
		-x2_3 + 72857891843829138807414952293702631612253362705515918943553327242243971433951779895243355261680497702183590916408639901065288271363073694000056,
		-3*x1_2^2*x2_1*k1_0 - 3*x2_2*x1_1^2*k1_0 - x1_3^2*x2_0*k1_0 - x2_3*x1_0^2*k1_0 - x4_3^2*k2_0 - x4_3^2*k3_0 + x2_4,
		-x6_2^2*k4_0^3 + 2*x2_1*x1_1^2*k1_0 + x1_2^2*x2_0*k1_0 + x2_2*x1_0^2*k1_0 - x4_2^2*k2_0 + x1_3^2,
		-2*x2_1*x1_1^2*k1_0 - x1_2^2*x2_0*k1_0 - x2_2*x1_0^2*k1_0 + x4_2^2*k2_0 + x4_2^2*k3_0 + x4_3^2,
		-x3_3 - 16570796273703089679116273000439654490244033866979725866789392675790961234641602958922485571038269719752342513825289260582866331262853392072361,
		3*x3_2*x5_1^2*k6_0 + 3*x5_2^2*x3_1*k6_0 + x3_3*x5_0^2*k6_0 + x5_3^2*x3_0*k6_0 - x4_3^2*k3_0 - x6_3^2*k5_0 + x3_4,
		-x6_2^2*k4_0^3 + 2*x5_1^2*x3_1*k6_0 + x3_2*x5_0^2*k6_0 + x5_2^2*x3_0*k6_0 - x6_2^2*k5_0 + x5_3^2,
		x6_2^2*k4_0^3 - 2*x5_1^2*x3_1*k6_0 - x3_2*x5_0^2*k6_0 - x5_2^2*x3_0*k6_0 + x6_2^2*k5_0 + x6_3^2,
		-x2_4 + 20393724960154830340258696333721628295653694363890367117282553424645684614479730391129946781753209723469995374606423090327350335171745848191675969236396336568944613370424894116693815936,
		-6*x2_2*x1_2^2*k1_0 - 4*x1_3^2*x2_1*k1_0 - 4*x2_3*x1_1^2*k1_0 - x1_4^2*x2_0*k1_0 - x2_4*x1_0^2*k1_0 - x4_4^2*k2_0 - x4_4^2*k3_0 + x2_5,
		-x6_3^2*k4_0^3 + 3*x1_2^2*x2_1*k1_0 + 3*x2_2*x1_1^2*k1_0 + x1_3^2*x2_0*k1_0 + x2_3*x1_0^2*k1_0 - x4_3^2*k2_0 + x1_4^2,
		-3*x1_2^2*x2_1*k1_0 - 3*x2_2*x1_1^2*k1_0 - x1_3^2*x2_0*k1_0 - x2_3*x1_0^2*k1_0 + x4_3^2*k2_0 + x4_3^2*k3_0 + x4_4^2,
		-x3_4 + 1495163971655858079428275722622943498508469275186450627849033328740407980583789939840027268568158742270507621314755271689516010432940330427955493524349701524929909334000282573332672512,
		6*x5_2^2*x3_2*k6_0 + 4*x3_3*x5_1^2*k6_0 + 4*x5_3^2*x3_1*k6_0 + x3_4*x5_0^2*k6_0 + x5_4^2*x3_0*k6_0 - x4_4^2*k3_0 - x6_4^2*k5_0 + x3_5,
		-x6_3^2*k4_0^3 + 3*x3_2*x5_1^2*k6_0 + 3*x5_2^2*x3_1*k6_0 + x3_3*x5_0^2*k6_0 + x5_3^2*x3_0*k6_0 - x6_3^2*k5_0 + x5_4^2,
		x6_3^2*k4_0^3 - 3*x3_2*x5_1^2*k6_0 - 3*x5_2^2*x3_1*k6_0 - x3_3*x5_0^2*k6_0 - x5_3^2*x3_0*k6_0 + x6_3^2*k5_0 + x6_4^2,
		-x2_5 - 7623420088367074484635636757830168420287760528070296716345887518664298224666390455440754847625858090478602061256299244815224954681185665120423477941346693893927755015116129321188783957941577413229751949626051300907974957234584,
		-10*x1_3^2*x2_2*k1_0 - 10*x2_3*x1_2^2*k1_0 - 5*x1_4^2*x2_1*k1_0 - 5*x2_4*x1_1^2*k1_0 - x1_5^2*x2_0*k1_0 - x2_5*x1_0^2*k1_0 - x4_5^2*k2_0 - x4_5^2*k3_0 + x2_6,
		-x6_4^2*k4_0^3 + 6*x2_2*x1_2^2*k1_0 + 4*x1_3^2*x2_1*k1_0 + 4*x2_3*x1_1^2*k1_0 + x1_4^2*x2_0*k1_0 + x2_4*x1_0^2*k1_0 - x4_4^2*k2_0 + x1_5^2,
		-6*x2_2*x1_2^2*k1_0 - 4*x1_3^2*x2_1*k1_0 - 4*x2_3*x1_1^2*k1_0 - x1_4^2*x2_0*k1_0 - x2_4*x1_0^2*k1_0 + x4_4^2*k2_0 + x4_4^2*k3_0 + x4_5^2,
		-x3_5 - 168715868716100082959722783442352329369585975835405250403864665570914088647411392308991289082084303763176208917421589279313545099396721950764274313741152863810073570206022981972484379895741265970710845358503165935904098815146,
		10*x3_3*x5_2^2*k6_0 + 10*x5_3^2*x3_2*k6_0 + 5*x3_4*x5_1^2*k6_0 + 5*x5_4^2*x3_1*k6_0 + x3_5*x5_0^2*k6_0 + x5_5^2*x3_0*k6_0 - x4_5^2*k3_0 - x6_5^2*k5_0 + x3_6,
		-x6_4^2*k4_0^3 + 6*x5_2^2*x3_2*k6_0 + 4*x3_3*x5_1^2*k6_0 + 4*x5_3^2*x3_1*k6_0 + x3_4*x5_0^2*k6_0 + x5_4^2*x3_0*k6_0 - x6_4^2*k5_0 + x5_5^2,
		x6_4^2*k4_0^3 - 6*x5_2^2*x3_2*k6_0 - 4*x3_3*x5_1^2*k6_0 - 4*x5_3^2*x3_1*k6_0 - x3_4*x5_0^2*k6_0 - x5_4^2*x3_0*k6_0 + x6_4^2*k5_0 + x6_5^2,
		-x2_6 + 737456905705073930791034383498856919270000921406677649579250132959449401015626556897022830287294366723679739548978658637649017754814862826193752032393729589406810069107275654638952845455767522757917128110204218219074421433558253196483967352953200451131003042181799896,
		-x3_6 + 22847280765999008981624734492555009888397297566642802463333888316967866290249606612198975860033451656261810574193295103636524192766363742896421552253866458660125742585086897218294119961121574073126815291963743244915175715093724878544216529632109756335656789556059913,
		z_aux - 1
	]:
	print("Running ChemicalReactionNetwork_with_weights");
	st := time[real]():
	G := Groebner[Basis](J, tdeg(x2_6, x3_6, x4_5, x2_5, x5_5, x1_5, x3_5, x6_5, x4_4, x2_4, x5_4, x1_4, x3_4, x6_4, x4_3, x2_3, x5_3, x1_3, x3_3, x6_3, x4_2, x2_2, x5_2, x1_2, x3_2, x6_2, x4_1, x2_1, x5_1, x1_1, x3_1, x6_1, x4_0, x2_0, x5_0, x1_0, x3_0, x6_0, z_aux, k1_0, k2_0, k4_0, k3_0, k5_0, k6_0), method=fgb, characteristic=0):
	print("ChemicalReactionNetwork_with_weights: ", time[real]() - st):
	runtime := min(runtime, time[real]() - st):
end do:

timings_fn := "/home/demin/Groebner.jl/benchmark/results/maple/benchmark_10/ChemicalReactionNetwork_with_weights/timings":
FileTools[Text][WriteLine](timings_fn, "ChemicalReactionNetwork_with_weights");
FileTools[Text][WriteLine](timings_fn, cat("total_time, ", String(runtime))):

