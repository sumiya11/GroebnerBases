#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function HIV2(; np=AbstractAlgebra, ordering=:degrevlex, k=np.QQ)
    R, (z_9,w_8,y_8,z_8,x_7,v_7,w_7,y_7,z_7,x_6,v_6,w_6,y_6,z_6,x_5,v_5,w_5,y_5,z_5,x_4,v_4,w_4,y_4,z_4,x_3,v_3,w_3,y_3,z_3,x_2,v_2,w_2,y_2,z_2,x_1,v_1,w_1,y_1,z_1,x_0,v_0,w_0,y_0,z_0,z_aux,lm_0,d_0,beta_0,a_0,k_0,u_0,c_0,q_0,b_0,h_0) = np.PolynomialRing(k, [:z_9,:w_8,:y_8,:z_8,:x_7,:v_7,:w_7,:y_7,:z_7,:x_6,:v_6,:w_6,:y_6,:z_6,:x_5,:v_5,:w_5,:y_5,:z_5,:x_4,:v_4,:w_4,:y_4,:z_4,:x_3,:v_3,:w_3,:y_3,:z_3,:x_2,:v_2,:w_2,:y_2,:z_2,:x_1,:v_1,:w_1,:y_1,:z_1,:x_0,:v_0,:w_0,:y_0,:z_0,:z_aux,:lm_0,:d_0,:beta_0,:a_0,:k_0,:u_0,:c_0,:q_0,:b_0,:h_0], ordering=ordering)
    sys = [
    		-z_0 + 391579310130776933615871,
		-w_0*y_0*c_0*q_0 + z_0*h_0 + z_1,
		-w_0 + 11747232036185701625123157,
		-w_0*y_0*z_0*c_0 + w_0*y_0*c_0*q_0 + w_0*b_0 + w_1,
		-z_1 + 603238345346139528359522036104641908547430757404926535076096396330351543065342569329178192530970096,
		-y_1*w_0*c_0*q_0 - w_1*y_0*c_0*q_0 + z_1*h_0 + z_2,
		-x_0*v_0*beta_0 + y_0*a_0 + y_1,
		-w_1 - 574390083393820420103212759171522849275323800567457691692315556508774738634619943653674738585986743,
		-z_1*w_0*y_0*c_0 - y_1*w_0*z_0*c_0 - w_1*y_0*z_0*c_0 + y_1*w_0*c_0*q_0 + w_1*y_0*c_0*q_0 + w_1*b_0 + w_2,
		-z_2 - 29495809942494772235717487304183887142454587420869561152232261111077119129926946003670610574309564618092345101563794158451252951899401078528644667279465056622989870416543178,
		-2*w_1*y_1*c_0*q_0 - y_2*w_0*c_0*q_0 - w_2*y_0*c_0*q_0 + z_2*h_0 + z_3,
		-v_1*x_0*beta_0 - x_1*v_0*beta_0 + y_1*a_0 + y_2,
		-y_0*k_0 + v_0*u_0 + v_1,
		x_0*v_0*beta_0 + x_0*d_0 + x_1 - lm_0,
		-w_2 + 72526766702336286507825226434003582721065918205231512442169043118987526401873302266876059227470399469758729806573577534508525039097990631413723803846283476257933579221333353,
		-2*y_1*z_1*w_0*c_0 - 2*w_1*z_1*y_0*c_0 - z_2*w_0*y_0*c_0 - 2*w_1*y_1*z_0*c_0 - y_2*w_0*z_0*c_0 - w_2*y_0*z_0*c_0 + 2*w_1*y_1*c_0*q_0 + y_2*w_0*c_0*q_0 + w_2*y_0*c_0*q_0 + w_2*b_0 + w_3,
		-z_3 + 3724360479477568236622724779173882605002730995788446608513197484643942968717402455098831776126940201242074854832830505138391424197393570926108499423090983113588950610968169165079829434421433538510808865018487980237424646729309138096329558471260151,
		-3*y_2*w_1*c_0*q_0 - 3*w_2*y_1*c_0*q_0 - y_3*w_0*c_0*q_0 - w_3*y_0*c_0*q_0 + z_3*h_0 + z_4,
		-2*x_1*v_1*beta_0 - v_2*x_0*beta_0 - x_2*v_0*beta_0 + y_2*a_0 + y_3,
		-y_1*k_0 + v_1*u_0 + v_2,
		v_1*x_0*beta_0 + x_1*v_0*beta_0 + x_1*d_0 + x_2,
		-w_3 - 10065260635460367136827570054743039971303285538244550872182162715368975218110847370878710258279443731462271690633257400089986872117350319845914336108436246847573437942215246570949277640001082095423119390494264184527042153943726452445744014647482237,
		-6*w_1*y_1*z_1*c_0 - 3*z_2*y_1*w_0*c_0 - 3*y_2*z_1*w_0*c_0 - 3*z_2*w_1*y_0*c_0 - 3*w_2*z_1*y_0*c_0 - z_3*w_0*y_0*c_0 - 3*y_2*w_1*z_0*c_0 - 3*w_2*y_1*z_0*c_0 - y_3*w_0*z_0*c_0 - w_3*y_0*z_0*c_0 + 3*y_2*w_1*c_0*q_0 + 3*w_2*y_1*c_0*q_0 + y_3*w_0*c_0*q_0 + w_3*y_0*c_0*q_0 + w_3*b_0 + w_4,
		-z_4 - 516866539497097390741430822517376417656042385836133479039598482854041835920781599692935765220288317208568307674240570033041820302571872340249173134476132079789328276084646776952006251103233801864353824418884420269152114838434532519317164510254202954894504821067054540160787808587306789965526678376390381380646541732318163,
		-6*w_2*y_2*c_0*q_0 - 4*y_3*w_1*c_0*q_0 - 4*w_3*y_1*c_0*q_0 - y_4*w_0*c_0*q_0 - w_4*y_0*c_0*q_0 + z_4*h_0 + z_5,
		-3*v_2*x_1*beta_0 - 3*x_2*v_1*beta_0 - v_3*x_0*beta_0 - x_3*v_0*beta_0 + y_3*a_0 + y_4,
		2*x_1*v_1*beta_0 + v_2*x_0*beta_0 + x_2*v_0*beta_0 + x_2*d_0 + x_3,
		-y_2*k_0 + v_2*u_0 + v_3,
		-z_5 + 98000219445755281465191234047409519457731340099562049701122536693667933661439374149287916104376587314997709305518514997881274053044896236528087300963711221079108242783818349292217649914304832608846704663912984082981256664618016281150945974695812571637338872669364928091333910816303015480587200779217401127972575362198750665563610538189010755829185777812616412129948629004723126787453477990542388,
		-10*y_3*w_2*c_0*q_0 - 10*w_3*y_2*c_0*q_0 - 5*y_4*w_1*c_0*q_0 - 5*w_4*y_1*c_0*q_0 - y_5*w_0*c_0*q_0 - w_5*y_0*c_0*q_0 + z_5*h_0 + z_6,
		-6*x_2*v_2*beta_0 - 4*v_3*x_1*beta_0 - 4*x_3*v_1*beta_0 - v_4*x_0*beta_0 - x_4*v_0*beta_0 + y_4*a_0 + y_5,
		-12*z_2*w_1*y_1*c_0 - 12*y_2*w_1*z_1*c_0 - 12*w_2*y_1*z_1*c_0 - 6*y_2*z_2*w_0*c_0 - 4*z_3*y_1*w_0*c_0 - 4*y_3*z_1*w_0*c_0 - 6*w_2*z_2*y_0*c_0 - 4*z_3*w_1*y_0*c_0 - 4*w_3*z_1*y_0*c_0 - z_4*w_0*y_0*c_0 - 6*w_2*y_2*z_0*c_0 - 4*y_3*w_1*z_0*c_0 - 4*w_3*y_1*z_0*c_0 - y_4*w_0*z_0*c_0 - w_4*y_0*z_0*c_0 + 6*w_2*y_2*c_0*q_0 + 4*y_3*w_1*c_0*q_0 + 4*w_3*y_1*c_0*q_0 + y_4*w_0*c_0*q_0 + w_4*y_0*c_0*q_0 + w_4*b_0 + w_5,
		3*v_2*x_1*beta_0 + 3*x_2*v_1*beta_0 + v_3*x_0*beta_0 + x_3*v_0*beta_0 + x_3*d_0 + x_4,
		-y_3*k_0 + v_3*u_0 + v_4,
		-z_6 - 21458030562658662580738258553823341766587663576114394834695028559774918019820596509904405389041607988467364762358827103883264176228057170978494313118084991093862092910419070546968589068608627622285541608722719273109079816490152719189187972967958945957946933218486487309661517029087886222602047679212036481982516143941270331116995678709894046484339971261780233952395479938807125800855113714268132010322034207128699220553082030907388119389480410220733479809310348610218079,
		-20*w_3*y_3*c_0*q_0 - 15*y_4*w_2*c_0*q_0 - 15*w_4*y_2*c_0*q_0 - 6*y_5*w_1*c_0*q_0 - 6*w_5*y_1*c_0*q_0 - y_6*w_0*c_0*q_0 - w_6*y_0*c_0*q_0 + z_6*h_0 + z_7,
		-10*v_3*x_2*beta_0 - 10*x_3*v_2*beta_0 - 5*v_4*x_1*beta_0 - 5*x_4*v_1*beta_0 - v_5*x_0*beta_0 - x_5*v_0*beta_0 + y_5*a_0 + y_6,
		-30*y_2*z_2*w_1*c_0 - 30*w_2*z_2*y_1*c_0 - 20*z_3*w_1*y_1*c_0 - 30*w_2*y_2*z_1*c_0 - 20*y_3*w_1*z_1*c_0 - 20*w_3*y_1*z_1*c_0 - 10*z_3*y_2*w_0*c_0 - 10*y_3*z_2*w_0*c_0 - 5*z_4*y_1*w_0*c_0 - 5*y_4*z_1*w_0*c_0 - 10*z_3*w_2*y_0*c_0 - 10*w_3*z_2*y_0*c_0 - 5*z_4*w_1*y_0*c_0 - 5*w_4*z_1*y_0*c_0 - z_5*w_0*y_0*c_0 - 10*y_3*w_2*z_0*c_0 - 10*w_3*y_2*z_0*c_0 - 5*y_4*w_1*z_0*c_0 - 5*w_4*y_1*z_0*c_0 - y_5*w_0*z_0*c_0 - w_5*y_0*z_0*c_0 + 10*y_3*w_2*c_0*q_0 + 10*w_3*y_2*c_0*q_0 + 5*y_4*w_1*c_0*q_0 + 5*w_4*y_1*c_0*q_0 + y_5*w_0*c_0*q_0 + w_5*y_0*c_0*q_0 + w_5*b_0 + w_6,
		6*x_2*v_2*beta_0 + 4*v_3*x_1*beta_0 + 4*x_3*v_1*beta_0 + v_4*x_0*beta_0 + x_4*v_0*beta_0 + x_4*d_0 + x_5,
		-y_4*k_0 + v_4*u_0 + v_5,
		-z_7 + 5577749280924487080075757231171031743354822071715892112217952137532438336218771414445727554974797200816590802671571482512393969909942909236616088107078369196678728899070868401051382034652738349436714476525941875879020437352974716904364501936790077254158995922237738283579804264268588965519025664074896789072276888776123306216048524032102523476927992446263909223919108230846122070777164234943059560088723172330230859379939527427325462452530168613108231688004536190574621583011662698450824506643742615018133550422437856474198827180129780321053982,
		-35*y_4*w_3*c_0*q_0 - 35*w_4*y_3*c_0*q_0 - 21*y_5*w_2*c_0*q_0 - 21*w_5*y_2*c_0*q_0 - 7*y_6*w_1*c_0*q_0 - 7*w_6*y_1*c_0*q_0 - y_7*w_0*c_0*q_0 - w_7*y_0*c_0*q_0 + z_7*h_0 + z_8,
		-90*w_2*y_2*z_2*c_0 - 60*z_3*y_2*w_1*c_0 - 60*y_3*z_2*w_1*c_0 - 60*z_3*w_2*y_1*c_0 - 60*w_3*z_2*y_1*c_0 - 30*z_4*w_1*y_1*c_0 - 60*y_3*w_2*z_1*c_0 - 60*w_3*y_2*z_1*c_0 - 30*y_4*w_1*z_1*c_0 - 30*w_4*y_1*z_1*c_0 - 20*y_3*z_3*w_0*c_0 - 15*z_4*y_2*w_0*c_0 - 15*y_4*z_2*w_0*c_0 - 6*z_5*y_1*w_0*c_0 - 6*y_5*z_1*w_0*c_0 - 20*w_3*z_3*y_0*c_0 - 15*z_4*w_2*y_0*c_0 - 15*w_4*z_2*y_0*c_0 - 6*z_5*w_1*y_0*c_0 - 6*w_5*z_1*y_0*c_0 - z_6*w_0*y_0*c_0 - 20*w_3*y_3*z_0*c_0 - 15*y_4*w_2*z_0*c_0 - 15*w_4*y_2*z_0*c_0 - 6*y_5*w_1*z_0*c_0 - 6*w_5*y_1*z_0*c_0 - y_6*w_0*z_0*c_0 - w_6*y_0*z_0*c_0 + 20*w_3*y_3*c_0*q_0 + 15*y_4*w_2*c_0*q_0 + 15*w_4*y_2*c_0*q_0 + 6*y_5*w_1*c_0*q_0 + 6*w_5*y_1*c_0*q_0 + y_6*w_0*c_0*q_0 + w_6*y_0*c_0*q_0 + w_6*b_0 + w_7,
		-20*x_3*v_3*beta_0 - 15*v_4*x_2*beta_0 - 15*x_4*v_2*beta_0 - 6*v_5*x_1*beta_0 - 6*x_5*v_1*beta_0 - v_6*x_0*beta_0 - x_6*v_0*beta_0 + y_6*a_0 + y_7,
		10*v_3*x_2*beta_0 + 10*x_3*v_2*beta_0 + 5*v_4*x_1*beta_0 + 5*x_4*v_1*beta_0 + v_5*x_0*beta_0 + x_5*v_0*beta_0 + x_5*d_0 + x_6,
		-y_5*k_0 + v_5*u_0 + v_6,
		-z_8 - 1644205192807033404764559007893172745748849984384312802354200787599776059355428090998225620786645231842428680599803099279698065002526758747161431644262518692015208453655878780813913561053608242320460813887802099921967392102887109597652291416944346692768469655604042964417877143328586109034623413791328007722399916097968656202908830017497359716003032873011341768633958462210430990403673940581962497822841126154764133423680404948778245115721750781412392929302931078597797754293988416603816534949548588565217177356266284435209162765551819170775850481304775023438958310814160758575680783396565217760341139831156750260898232,
		-70*w_4*y_4*c_0*q_0 - 56*y_5*w_3*c_0*q_0 - 56*w_5*y_3*c_0*q_0 - 28*y_6*w_2*c_0*q_0 - 28*w_6*y_2*c_0*q_0 - 8*y_7*w_1*c_0*q_0 - 8*w_7*y_1*c_0*q_0 - y_8*w_0*c_0*q_0 - w_8*y_0*c_0*q_0 + z_8*h_0 + z_9,
		-35*v_4*x_3*beta_0 - 35*x_4*v_3*beta_0 - 21*v_5*x_2*beta_0 - 21*x_5*v_2*beta_0 - 7*v_6*x_1*beta_0 - 7*x_6*v_1*beta_0 - v_7*x_0*beta_0 - x_7*v_0*beta_0 + y_7*a_0 + y_8,
		-210*z_3*w_2*y_2*c_0 - 210*y_3*w_2*z_2*c_0 - 210*w_3*y_2*z_2*c_0 - 140*y_3*z_3*w_1*c_0 - 105*z_4*y_2*w_1*c_0 - 105*y_4*z_2*w_1*c_0 - 140*w_3*z_3*y_1*c_0 - 105*z_4*w_2*y_1*c_0 - 105*w_4*z_2*y_1*c_0 - 42*z_5*w_1*y_1*c_0 - 140*w_3*y_3*z_1*c_0 - 105*y_4*w_2*z_1*c_0 - 105*w_4*y_2*z_1*c_0 - 42*y_5*w_1*z_1*c_0 - 42*w_5*y_1*z_1*c_0 - 35*z_4*y_3*w_0*c_0 - 35*y_4*z_3*w_0*c_0 - 21*z_5*y_2*w_0*c_0 - 21*y_5*z_2*w_0*c_0 - 7*z_6*y_1*w_0*c_0 - 7*y_6*z_1*w_0*c_0 - 35*z_4*w_3*y_0*c_0 - 35*w_4*z_3*y_0*c_0 - 21*z_5*w_2*y_0*c_0 - 21*w_5*z_2*y_0*c_0 - 7*z_6*w_1*y_0*c_0 - 7*w_6*z_1*y_0*c_0 - z_7*w_0*y_0*c_0 - 35*y_4*w_3*z_0*c_0 - 35*w_4*y_3*z_0*c_0 - 21*y_5*w_2*z_0*c_0 - 21*w_5*y_2*z_0*c_0 - 7*y_6*w_1*z_0*c_0 - 7*w_6*y_1*z_0*c_0 - y_7*w_0*z_0*c_0 - w_7*y_0*z_0*c_0 + 35*y_4*w_3*c_0*q_0 + 35*w_4*y_3*c_0*q_0 + 21*y_5*w_2*c_0*q_0 + 21*w_5*y_2*c_0*q_0 + 7*y_6*w_1*c_0*q_0 + 7*w_6*y_1*c_0*q_0 + y_7*w_0*c_0*q_0 + w_7*y_0*c_0*q_0 + w_7*b_0 + w_8,
		-y_6*k_0 + v_6*u_0 + v_7,
		20*x_3*v_3*beta_0 + 15*v_4*x_2*beta_0 + 15*x_4*v_2*beta_0 + 6*v_5*x_1*beta_0 + 6*x_5*v_1*beta_0 + v_6*x_0*beta_0 + x_6*v_0*beta_0 + x_6*d_0 + x_7,
		-z_9 + 547169434379018145028611952347265787172199439668093986338563317785852393916605948818072737647734930569662248686887630106250170916620431557805104040465245886891859630463989194155254027609865997719559075910769153141887632327231757960445334365558978268855512815198121035198224568168185312239960245138751315716963041810932606675513939807949557458205653521468787914237949369491510319720103583796426594093631148917030950116046047765636929109396208199320896283070375401931791154858990255781028687359602238037994809564110293220500908246017866610361218898309281015955618403398237167794184297295140520001201453021971553871890098816334741387420433906924143868197736158620363296005190522485295124049435107,
		-w_4 + 1908418664542663099774091716482431588374718871839089056219614579971723103702336041333144915382378846941799838921829645861013275662853484016597679102928009974796834453662803702825468863863699315044327414900631216745549361241879675632162230381413209813079885090508303150179123212793333319289763289097064792543950982117615554,
		-w_5 - 417865452360254033504908453978493737666079490808113004239654956627219414784331711209111925283255385975513322275446603895846428020148233461120142782852541875605278407949821612766657667057555188148906991687680366739791207569112150140359955591390126222672894978054822180835696002982092410893734533201028323111216374274942030006580232521518488130704516322548470273619123822892391160346504020692095957,
		-w_6 + 108618948958045071996686191814880701723273779780900537851211480014575954859862235158064614208312594040667185441627007847229742411532034623787664180692273256112833274203152565248107495837749917833198273389140944246934942898473699518366663922813793434057738114266639202852428237429743321235897912960657393304612016304368015117310995538286830206980622039291214698553695303384645857319518546092967736770353565298943410835213622034668330539695564620041933350395927208045146375,
		-w_7 - 32018620938167915709424800884179286400769850246168416971678757387326577790632020350923544485495646077637968187175721185871067568698114797069132849683581823639272546363658830702006575242653103871085066129287516159880704931949640223431668861822555144067653403459119184691919550430168307856142339035519933356454825520213063466807127469721496469647277108997670176435798508951676198010280591284129007081055926705383684593216547231892829664223470094372139619480976098074519244480072648434009312814289977866073070383674337616936127106839527611963606981,
		-w_8 + 10655367581234525241629788927939090277671296368705864939130569241961936206395813457389337876591554076728476295485298661373225491120223759292480329085090132276945483193842077671935435551158231403512950548263059434981109528221157431942640281970058313649122539084766043649565177284923008382695404456058860264634269420285791899882734001989063871991771314320957623245853109055586163026501019523045737918594445219682828379192621279639096563176615776544296906282357060466021309911440499438196138881527087217758263306505943656173773494467108160684251721889266292373387780029621670660070518810549666699067877947310419393249067624,
		z_aux - 1
    ]
end
