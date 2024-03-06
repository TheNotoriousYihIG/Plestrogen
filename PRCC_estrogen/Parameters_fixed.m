%% vectors of values to loop over 

Lynconc=10000/(6.022e14)*250000/(1e-6);
Rtot=6000/(6.022e14)*250000/(1e-6);
CRP = logspace(-3,1,40)*281; % 281 nM is equivalent to 1 ug/ml, go from 0.281 to 2810
RICs=linspace(1,10,10)*Rtot/10;
Ls=linspace(1,10,10)*3*Lynconc/10; % max 3-fold Lyn expression relative to control, informed by osteocyte paper fig 2C 
E2ICs=linspace(0,100,11);

Rfrac = RICs/Rtot; % only needed for plotting

%% rate constants

k1p = 7.87e-6; % Miura 2002 % A + R <-> AR
k1m = 0.0322; % A + R <-> AR
k2m = 1; % AR + R <-> RAR
k3p = 7.87e-6; % A + Rl <-> ARl
k3m = 0.0322; % A + Rl <-> ARl
k4m = 1; % AR + Rl <-> RARl
k5m = 1; % R + ARl <-> RARl
k6m = 1; % Rl + ARl <-> RlARl
k7p = 100; % /s Faeder % double phosphorylation of RlARl
k8p = 0; %decay rate of RlpARlp
k9p = 1.6e-2;% /nM*s Faeder % RlpARlp + S <-> SRlpARlp
k9m= 0.05; % /s Faeder % RlpARlp + S <-> SRlpARlp
k10p = 1.6e-2; % SRlpARlp + S <-> SRlpARlpS
k10m = 0.05; % SRlpARlp + S <-> SRlpARlpS
k11pb = 1.6e-2; % assume same as Syk for now % SRlpARlpS + L <-> SppRlpARlpSpp
k12p= 0.05; % same as above % lose one Spp SppRlpARlpSpp -> SppRlpARlp
k13p = 0.05; % same as above % gain one Spp SppRlpARlpSpp -> SppRlpARlp

%% Parameter Labels 
PRCC_var={'a', '\mu', '\sigma','E_2','k_{2b}^+','k_{4b}^+','k_{5b}^+','k_{6b}^+'};% 

%% TIME SPAN OF THE SIMULATION
t_end=4000; % length of the simulations
tspan=(0:1:t_end);   % time points where the output is calculated
time_points=[2000 4000]; % time points of interest for the US analysis

%% INITIAL CONDITION FOR THE ODE MODEL
Sykconc=5000/(6.022e14)*250000/(1e-6);

AR_IC = 0;
RAR_IC = 0;
ARl_IC = 0;
RARl_IC = 0;
RlARl_IC = 0;
RlpARlp_IC = 0;
S_IC = Sykconc; % nM
SRlpARlp_IC = 0;
SRlpARlpS_IC = 0;
SppRlpARlpSpp_IC = 0;
SppRlpARlp_IC = 0;
Spp_IC = 0;

