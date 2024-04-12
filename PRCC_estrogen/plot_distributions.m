%Linh Huynh
close all; clear all;
%%
simulation_Linh  = load('Model_LHS_Linh.mat'); %please replace with your file name
simulation_Helen = load('Model_LHS_helen.mat'); %please replace with your file name
simulation_unknown = load('Model_LHS.mat');
EC50_3Dmat_Linh  = simulation_Linh.EC50;
EC50_3Dmat_Helen = simulation_Helen.EC50;
EC50_3Dmat_unknown = simulation_unknown.EC50;
E2IC_Linh    = (simulation_Linh.E2ICs)';
E2IC_Helen   = (simulation_Helen.E2ICs)';
E2IC_unknown = (simulation_unknown.E2ICs)';
E2IC = E2IC_Linh;
[nE2s,nLyns,nruns] = size(EC50_3Dmat_Linh);
%%
for idLyn = 1:nLyns
    EC50_2Dmat_eachLyn = [];
    EC50_eachrun_eachLyn_Linh = EC50_3Dmat_Linh(1,idLyn,1);
    EC50_eachrun_eachLyn_Helen = EC50_3Dmat_Helen(1,idLyn,1);
    EC50_eachrun_eachLyn_unknown = EC50_3Dmat_unknown(1,idLyn,1);
    Lyn = EC50_eachrun_eachLyn_Linh;
    for idrun = 1:nruns
        EC50_eachrun_eachLyn_Linh = EC50_3Dmat_Linh(:,idLyn,idrun);
        EC50_eachrun_eachLyn_Helen = EC50_3Dmat_Helen(:,idLyn,idrun);
        EC50_eachrun_eachLyn_unknown = EC50_3Dmat_Helen(:,idLyn,idrun);
        EC50_eachrun_eachLyn = [EC50_eachrun_eachLyn_Linh EC50_eachrun_eachLyn_Helen EC50_eachrun_eachLyn_unknown];
        EC50_2Dmat_eachLyn   = [EC50_2Dmat_eachLyn EC50_eachrun_eachLyn];
        figure(idLyn)
        plot(E2IC,EC50_eachrun_eachLyn)
        hold on       
        xlabel('E2IC')
        ylabel('EC50')
    end
    mean_EC50eachrunLyn   = mean(EC50_2Dmat_eachLyn,2);
    var_EC50eachrunLyn    = var(EC50_2Dmat_eachLyn,0,2);
    median_EC50eachrunLyn = median(EC50_2Dmat_eachLyn,2);
    figure(idLyn)
    plot(E2IC, mean_EC50eachrunLyn,'k-.','LineWidth',3)
    hold on 
    plot(E2IC, mean_EC50eachrunLyn+sqrt(var_EC50eachrunLyn),'k-','LineWidth',3)
    hold on
    plot(E2IC, mean_EC50eachrunLyn-sqrt(var_EC50eachrunLyn),'k-','LineWidth',3)
    hold on
    plot(E2IC, median_EC50eachrunLyn,'k-*','LineWidth',3)
    title(['Lyn=',num2str(Lyn)])
end


