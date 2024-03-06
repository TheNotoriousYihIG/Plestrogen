
%% E2 and L

L=Ls(j); % (M3)
E2=E2ICs(k); % (M1), (M2)

%% INITIAL CONDITION FOR THE ODE MODEL

Rl_IC=RICs(j); % (M3)
R_IC=Rtot-Rl_IC;
A_IC=CRP(i);

y0 = [ A_IC, R_IC, AR_IC, RAR_IC, Rl_IC, ARl_IC, RARl_IC, RlARl_IC, RlpARlp_IC, S_IC, SRlpARlp_IC, SRlpARlpS_IC, SppRlpARlpSpp_IC, SppRlpARlp_IC, Spp_IC];
         
% Variables Labels
y_var_label={'A','R','AR','RAR','R_L','AR_L','RAR_L','R_LAR_L','R_L^*AR_L^*','S','SR_L^*AR_L^*','SR_L^*AR_L^*S','S^**R_L^*AR_L^*S^**','S^**R_L^*AR_L^*','S^**'};

