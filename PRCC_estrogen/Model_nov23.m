function dydt =Model_nov23(t,y,LHSmatrix,x,i,j,k)

% Parameters

Parameters_fixed;
Parameters_loop;

a = LHSmatrix(x,1);
mu= LHSmatrix(x,2);
sig=LHSmatrix(x,3);
k2pb = LHSmatrix(x,4);
k4pb = LHSmatrix(x,5);
k5pb = LHSmatrix(x,6);
k6pb = LHSmatrix(x,7);
k11p = k11pb * (1 + a*exp(-(E2-mu)^2/(2*sig^2)));
k2p =  k2pb/(1+(E2/50)^3);
k4p =  k4pb/(1+(E2/50)^3);
k5p =  k5pb/(1+(E2/50)^3);
k6p =  k6pb/(1+(E2/50)^3);

dy = zeros(15,1);

% Rename Variables
A   = y(1);
R   = y(2);
AR   = y(3);
RAR   = y(4);
Rl   = y(5);
ARl   = y(6);
RARl   = y(7);
RlARl   = y(8);
RlpARlp   = y(9);
S   = y(10);
SRlpARlp   = y(11);
SRlpARlpS   = y(12);
SppRlpARlpSpp   = y(13);
SppRlpARlp   = y(14);
Spp   = y(15);

% ODEs from reaction equations

% A
dy(1)  =  -  k1p * A * R  +  k1m * AR  -  k3p * A * Rl  +  k3m * ARl;

% R
dy(2)  =  -  k1p * A * R  +  k1m * AR  -  k2p * R * AR  +  k2m * RAR  -  k5p * R * ARl  +  k5m * RARl;

% AR
dy(3)  =  +  k1p * A * R  -  k1m * AR  -  k2p * R * AR  +  k2m * RAR  -  k4p * AR * Rl  +  k4m * RARl;

% RAR
dy(4)  =  +  k2p * R * AR  -  k2m * RAR;

% Rl
dy(5)  =  -  k3p * A * Rl  +  k3m * ARl  -  k4p * AR * Rl  +  k4m * RARl  -  k6p * Rl * ARl  +  k6m * RlARl;

% ARl
dy(6)  =  +  k3p * A * Rl  -  k3m * ARl  -  k5p * R * ARl  +  k5m * RARl  -  k6p * Rl * ARl  +  k6m * RlARl;

% RARl
dy(7)  =  +  k4p * AR * Rl  -  k4m * RARl  +  k5p * R * ARl  -  k5m * RARl;

% RlARl
dy(8)  =  +  k6p * Rl * ARl  -  k6m * RlARl  -  k7p * RlARl;

% RlpARlp
dy(9)  =  +  k7p * RlARl  -  k9p * RlpARlp * S  +  k9m* SRlpARlp  +  k13p * SppRlpARlp-k8p* RlpARlp;

% S
dy(10)  =  -  k9p * RlpARlp * S  +  k9m* SRlpARlp  -  k10p * S * SRlpARlp  +  k10m * SRlpARlpS;

% SRlpARlp
dy(11)  =  +  k9p * RlpARlp * S  -  k9m* SRlpARlp  -  k10p * S * SRlpARlp  +  k10m * SRlpARlpS;

% SRlpARlpS
dy(12)  =  +  k10p * S * SRlpARlp  -  k10m * SRlpARlpS  -  k11p * SRlpARlpS * L;

% SppRlpARlpSpp
dy(13)  =  +  k11p * SRlpARlpS * L  -  k12p* SppRlpARlpSpp;

% SppRlpARlp
dy(14)  =  +  k12p* SppRlpARlpSpp  -  k13p * SppRlpARlp;

% Spp
dy(15)  =  +  k12p* SppRlpARlpSpp  +  k13p * SppRlpARlp;

dydt = dy;

end




