# HIV
#! format: off
using AbstractAlgebra, Groebner

ring, (x₄_8, x₄_7, x₃_7, x₄_6, x₂_6, x₃_6, x₁_6, x₄_5, x₂_5, x₃_5, x₁_5, x₄_4, x₂_4, x₃_4, x₁_4, x₄_3, x₂_3, x₃_3, x₁_3, x₄_2, x₂_2, x₃_2, x₁_2, x₄_1, x₂_1, x₃_1, x₁_1, x₄_0, x₂_0, x₃_0, x₁_0, z_aux, β_0, d_0, s_0, q₁_0, k₁_0, μ₁_0, q₂_0, μ₂_0, c_0, k₂_0) = polynomial_ring(
    QQ, 
    ["x₄_8", "x₄_7", "x₃_7", "x₄_6", "x₂_6", "x₃_6", "x₁_6", "x₄_5", "x₂_5", "x₃_5", "x₁_5", "x₄_4", "x₂_4", "x₃_4", "x₁_4", "x₄_3", "x₂_3", "x₃_3", "x₁_3", "x₄_2", "x₂_2", "x₃_2", "x₁_2", "x₄_1", "x₂_1", "x₃_1", "x₁_1", "x₄_0", "x₂_0", "x₃_0", "x₁_0", "z_aux", "β_0", "d_0", "s_0", "q₁_0", "k₁_0", "μ₁_0", "q₂_0", "μ₂_0", "c_0", "k₂_0"], 
    ordering=:degrevlex
)
system = [
	-x₁_0 + 2267583049801222591,
	x₄_0*x₁_0*β_0 + x₁_0*d_0 + x₁_1 - s_0,
	-x₄_0 + 2936102718120596256,
	x₄_0*c_0 - x₃_0*k₂_0 + x₄_1,
	-x₁_1 - 22470641512506757278673576441024928518549231929092760755,
	x₁_1*x₄_0*β_0 + x₄_1*x₁_0*β_0 + x₁_1*d_0 + x₁_2,
	-x₄_1 + 3169502399538564952740843547785672518,
	x₄_1*c_0 - x₃_1*k₂_0 + x₄_2,
	-x₄_0*x₁_0*β_0*q₂_0 - x₂_0*k₁_0 + x₃_0*μ₂_0 + x₃_1,
	-x₁_2 + 222673092404643944016430272262120679184916227139759404611696535522671892387648386784391444318,
	2*x₄_1*x₁_1*β_0 + x₁_2*x₄_0*β_0 + x₄_2*x₁_0*β_0 + x₁_2*d_0 + x₁_3,
	-x₄_2 + 229936853644756794239042584324000285164339387921075949540713074475267434059112984369062143866,
	x₄_2*c_0 - x₃_2*k₂_0 + x₄_3,
	-x₁_1*x₄_0*β_0*q₂_0 - x₄_1*x₁_0*β_0*q₂_0 - x₂_1*k₁_0 + x₃_1*μ₂_0 + x₃_2,
	-x₄_0*x₁_0*β_0*q₁_0 + x₂_0*k₁_0 + x₂_0*μ₁_0 + x₂_1,
	-x₁_3 - 3966339130112060108590606014037865868847445687816932477916100533181667195583630872439621879669421693111218748085999040208884008290,
	3*x₁_2*x₄_1*β_0 + 3*x₄_2*x₁_1*β_0 + x₁_3*x₄_0*β_0 + x₄_3*x₁_0*β_0 + x₁_3*d_0 + x₁_4,
	-x₄_3 - 2278562017482883085803874040257768500710965684627135640780154869867538029755960386387734789247311468904476277537396673749703075226,
	x₄_3*c_0 - x₃_3*k₂_0 + x₄_4,
	-2*x₄_1*x₁_1*β_0*q₂_0 - x₁_2*x₄_0*β_0*q₂_0 - x₄_2*x₁_0*β_0*q₂_0 - x₂_2*k₁_0 + x₃_2*μ₂_0 + x₃_3,
	-x₁_1*x₄_0*β_0*q₁_0 - x₄_1*x₁_0*β_0*q₁_0 + x₂_1*k₁_0 + x₂_1*μ₁_0 + x₂_2,
	-x₄_4 + 40586626757337642171343477880901910511983400063251836770319034077739584935831769959227603289492449999565061195488069785790692450303432436968239601231731466315385358154,
	x₄_4*c_0 - x₃_4*k₂_0 + x₄_5,
	-3*x₁_2*x₄_1*β_0*q₂_0 - 3*x₄_2*x₁_1*β_0*q₂_0 - x₁_3*x₄_0*β_0*q₂_0 - x₄_3*x₁_0*β_0*q₂_0 - x₂_3*k₁_0 + x₃_3*μ₂_0 + x₃_4,
	-2*x₄_1*x₁_1*β_0*q₁_0 - x₁_2*x₄_0*β_0*q₁_0 - x₄_2*x₁_0*β_0*q₁_0 + x₂_2*k₁_0 + x₂_2*μ₁_0 + x₂_3,
	-x₄_5 - 1115963491558715001441759971986218314063338495056769188909528546955207056552358053700890213536281157360517972000225277359391469002193520544835331775857109398699848271207478316382052715436933980650224789962,
	x₄_5*c_0 - x₃_5*k₂_0 + x₄_6,
	-6*x₄_2*x₁_2*β_0*q₂_0 - 4*x₁_3*x₄_1*β_0*q₂_0 - 4*x₄_3*x₁_1*β_0*q₂_0 - x₁_4*x₄_0*β_0*q₂_0 - x₄_4*x₁_0*β_0*q₂_0 - x₂_4*k₁_0 + x₃_4*μ₂_0 + x₃_5,
	-3*x₁_2*x₄_1*β_0*q₁_0 - 3*x₄_2*x₁_1*β_0*q₁_0 - x₁_3*x₄_0*β_0*q₁_0 - x₄_3*x₁_0*β_0*q₁_0 + x₂_3*k₁_0 + x₂_3*μ₁_0 + x₂_4,
	-x₄_6 + 31919916282324601957843758425102958359198996588171539012425044787892219138452390096541407255224305095444553116677734021544025898429934227506191354685900678727086627843484298929005082381595330353044936413326387193748801158882165255855240051850,
	x₄_6*c_0 - x₃_6*k₂_0 + x₄_7,
	-10*x₁_3*x₄_2*β_0*q₂_0 - 10*x₄_3*x₁_2*β_0*q₂_0 - 5*x₁_4*x₄_1*β_0*q₂_0 - 5*x₄_4*x₁_1*β_0*q₂_0 - x₁_5*x₄_0*β_0*q₂_0 - x₄_5*x₁_0*β_0*q₂_0 - x₂_5*k₁_0 + x₃_5*μ₂_0 + x₃_6,
	6*x₄_2*x₁_2*β_0 + 4*x₁_3*x₄_1*β_0 + 4*x₄_3*x₁_1*β_0 + x₁_4*x₄_0*β_0 + x₄_4*x₁_0*β_0 + x₁_4*d_0 + x₁_5,
	-6*x₄_2*x₁_2*β_0*q₁_0 - 4*x₁_3*x₄_1*β_0*q₁_0 - 4*x₄_3*x₁_1*β_0*q₁_0 - x₁_4*x₄_0*β_0*q₁_0 - x₄_4*x₁_0*β_0*q₁_0 + x₂_4*k₁_0 + x₂_4*μ₁_0 + x₂_5,
	-x₄_7 - 1051392303887413293957315536902397035877610524491871951823562947895688635606333602605592588945986319056339120698199191578446669606423119888348701256246371021508307866085445552258224093307398132141810829494411774468004499440218559882238092284021288311447074787072389763164182901994,
	x₄_7*c_0 - x₃_7*k₂_0 + x₄_8,
	-20*x₄_3*x₁_3*β_0*q₂_0 - 15*x₁_4*x₄_2*β_0*q₂_0 - 15*x₄_4*x₁_2*β_0*q₂_0 - 6*x₁_5*x₄_1*β_0*q₂_0 - 6*x₄_5*x₁_1*β_0*q₂_0 - x₁_6*x₄_0*β_0*q₂_0 - x₄_6*x₁_0*β_0*q₂_0 - x₂_6*k₁_0 + x₃_6*μ₂_0 + x₃_7,
	10*x₁_3*x₄_2*β_0 + 10*x₄_3*x₁_2*β_0 + 5*x₁_4*x₄_1*β_0 + 5*x₄_4*x₁_1*β_0 + x₁_5*x₄_0*β_0 + x₄_5*x₁_0*β_0 + x₁_5*d_0 + x₁_6,
	-10*x₁_3*x₄_2*β_0*q₁_0 - 10*x₄_3*x₁_2*β_0*q₁_0 - 5*x₁_4*x₄_1*β_0*q₁_0 - 5*x₄_4*x₁_1*β_0*q₁_0 - x₁_5*x₄_0*β_0*q₁_0 - x₄_5*x₁_0*β_0*q₁_0 + x₂_5*k₁_0 + x₂_5*μ₁_0 + x₂_6,
	-x₁_4 + 109057835498624768560791343301188988770257653269259555333926019343546543688558115174726972529400779761784102727382662968598103346755119303987310733301004563815031360836,
	-x₁_5 - 3119382493584447316933721198464750789531436229502362001057994910387546329009757932140805128948564233507396770365299541032372399382176174688981811689260831510871496363258943293241231037351944070152008106550,
	-x₁_6 + 102747598634897453882726958490862765016181166791553648582093325986321489003794257183409666364343189589022296735656712892200642013989504151006088752049285984394791568977501235968905278618254920619768916074547487416225091868584210499700435186788,
	-x₄_8 + 42029739390445689245466994420997415003131863089292167426559972685535023324616203142962893039847974794000350334469216889922654687825338162790336725311652083693414304914908177948072982558101573301324725354925335553534745435295639066645862466166545213065033356557963888238948049718036048566101929191328999117552272001258,
	z_aux - 1
]

