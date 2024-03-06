%% The results should be compared to the PRCC results section in
%% Supplementary Material D and Table D.1 for different N (specified by
%% "runs" in the script below

clear all;
close all;

%% Sample size N

runs=100;

%% LHS MATRIX  
% (if sampling fewer variables, delete below as appropriate, and edit
% Parameters_fixed.m to set the values of the non-sampled parameters)

Parameters_LHS;

a_LHS = LHS_Call(0.1, a, 150, 0 ,runs,'unif'); % baseline = 99
mu_LHS = LHS_Call(0, mu, 100, 0 ,runs,'unif'); % baseline = 50
sig_LHS = LHS_Call(0.1, sig, 50, 0, runs,'unif'); % baseline = 12
k2pb_LHS = LHS_Call(1e-4, k2pb, 1e-2, 0, runs,'unif'); % baseline = 1e-3
k4pb_LHS = LHS_Call(1e-4 , k4pb ,1e-2 , 0 , runs , 'unif');  % baseline = 1e-3
k5pb_LHS = LHS_Call(1e-4,k5pb,1e-2, 0 ,runs,'unif'); % baseline = 1e-3
k6pb_LHS = LHS_Call(1e-4,k6pb,1e-2, 0 ,runs,'unif'); % baseline = 1e-3

LHSmatrix=[a_LHS mu_LHS sig_LHS k2pb_LHS ...
    k4pb_LHS k5pb_LHS k6pb_LHS ];


%% run

f = @Model_nov23; % ode system to solve

Parameters_fixed; % set vectors E2ICs, RICs, CRP to loop over
nE = length(E2ICs); nR = length(RICs); nC = length(CRP);

EC50 = zeros(nE,nR,runs);
spp = zeros(1,nC);

%runs=1; nE=1; nR=1; nC=1; % test that the code runs for one set of values

for x=1:runs %Run solution x times choosing different values
    for k=1:nE % loop over estrogen
        for j=1:nR % loop over concentration of receptor bound to Lyn
            for i=1:nC % loop over agonist CRP
                k
                j
                i
                x

                LHSmatrix(x,:);

                % set the initial conditions

                Parameters_fixed; 
                Parameters_loop;

                % note: the parameters are set by calls to
                % Parameters_fixed.m and Parameters_loop.m inside of
                % f (the multiple calls to Parameters_fixed,loop seems
                % messy and I'm sure could be improved on by passing 
                % parameters as arguments to f, as is done with LHSmatrix)

                [t,y] = ode15s(@(t,y)f(t,y,LHSmatrix,x,i,j,k),tspan,y0,[]);

                spp(i) = y(end,15);

            end

            % compute EC50
            EC50_ind = max(find(spp<max(spp)/2));
            EC50(k,j,x) = CRP(EC50_ind);
        end
    end
end
%% Save the workspace

save Model_LHS.mat;
%% CALCULATE PRCC

%[prcc sign sign_label]=PRCC(LHSmatrix,V_lhs,1:length(time_points),PRCC_var,alpha);
%%
