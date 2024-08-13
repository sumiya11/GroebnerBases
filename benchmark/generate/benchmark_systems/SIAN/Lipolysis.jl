#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Lipolysis(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (x2_4,x3_4,x1_3,x2_3,x3_3,x5_3,x1_2,x2_2,x3_2,x5_2,x1_1,x2_1,x3_1,x4_1,x5_1,x1_0,x2_0,x3_0,x4_0,x5_0,z_aux,k2_0,k4_0,k3_0) = np.polynomial_ring(k, [:x2_4,:x3_4,:x1_3,:x2_3,:x3_3,:x5_3,:x1_2,:x2_2,:x3_2,:x5_2,:x1_1,:x2_1,:x3_1,:x4_1,:x5_1,:x1_0,:x2_0,:x3_0,:x4_0,:x5_0,:z_aux,:k2_0,:k4_0,:k3_0], internal_ordering=internal_ordering)
    sys = [
    		-x2_0 - x3_0 + 23625618972,
		x1_0*x2_0*k4_0 + x2_0*k2_0*k4_0 + x2_1*x1_0 - k(2)//k(3)*x1_0*x5_0 + x2_1*k2_0,
		-k(1)//k(2)*x2_0*k4_0 + x3_0*k4_0 + x3_1,
		-x1_0 + 9830420133,
		x1_1*x1_0 + x1_0*x5_0 + x1_1*k2_0,
		-x4_0 + 34149706849,
		-k(1)//k(2)*x1_0*x2_0*k4_0 - x1_0*x3_0*k4_0 - k(1)//k(2)*x2_0*k2_0*k4_0 - x3_0*k2_0*k4_0 + x4_1*x1_0 - k(1)//k(3)*x1_0*x5_0 + x4_1*k2_0,
		-x2_1 - x3_1 - k(8346268959406482555607267524094)//k(33520429537),
		-k(1)//k(2)*x2_1*k4_0 + x3_1*k4_0 + x3_2,
		x2_1*x1_0*k4_0 + x1_1*x2_0*k4_0 + x2_1*k2_0*k4_0 + x1_1*x2_1 + x2_2*x1_0 - k(2)//k(3)*x5_1*x1_0 - k(2)//k(3)*x1_1*x5_0 + x2_2*k2_0,
		x5_0*k3_0 + x5_1,
		-x1_1 - k(64040175431533214073)//k(33520429537),
		x1_1^2 + x1_2*x1_0 + x5_1*x1_0 + x1_1*x5_0 + x1_2*k2_0,
		-x2_2 - x3_2 + k(38814377927594391514814102478440639643874931594510655528967792)//k(37664198097502538226596976757153),
		2*x1_1*x2_1*k4_0 + x2_2*x1_0*k4_0 + x1_2*x2_0*k4_0 + x2_2*k2_0*k4_0 + 2*x2_2*x1_1 + x1_2*x2_1 - k(4)//k(3)*x1_1*x5_1 + x2_3*x1_0 - k(2)//k(3)*x5_2*x1_0 - k(2)//k(3)*x1_2*x5_0 + x2_3*k2_0,
		-k(1)//k(2)*x2_2*k4_0 + x3_2*k4_0 + x3_3,
		x5_1*k3_0 + x5_2,
		-x1_2 + k(2044755460127629854948894610214896965516978260017218)//k(37664198097502538226596976757153),
		3*x1_2*x1_1 + 2*x1_1*x5_1 + x1_3*x1_0 + x5_2*x1_0 + x1_2*x5_0 + x1_3*k2_0,
		-x2_3 - x3_3 + k(2069634378464961761198082514638341883138738655777183668025754626331669705216536323782762602560)//k(42320215997294003292681605895455555654535650412591457),
		-k(1)//k(2)*x2_3*k4_0 + x3_3*k4_0 + x3_4,
		3*x2_2*x1_1*k4_0 + 3*x1_2*x2_1*k4_0 + x2_3*x1_0*k4_0 + x1_3*x2_0*k4_0 + x2_3*k2_0*k4_0 + 3*x1_2*x2_2 + 3*x2_3*x1_1 - 2*x5_2*x1_1 + x1_3*x2_1 - 2*x1_2*x5_1 + x2_4*x1_0 - k(2)//k(3)*x5_3*x1_0 - k(2)//k(3)*x1_3*x5_0 + x2_4*k2_0,
		x5_2*k3_0 + x5_3,
		-x2_4 - x3_4 - k(104445600288962877988370027298250692676204990563160619506421387611941798420449980407267612236903279141010284657051568777716848)//k(47551807088025540365026242155154116429482762791658091232180967049129785633),
		-x1_3 - k(65287530266246559534830674248892260404632012669142953561228821448649827314583077780)//k(42320215997294003292681605895455555654535650412591457),
		-x4_1 + k(8346268959470522731038800738167)//k(33520429537),
		x1_0*z_aux + z_aux*k2_0 - 1
    ]
end
