%Linh Huynh
close all; clear all;

simulation50=load('Model_LHS_Linh.mat'); %please replace with your file name
EC50_3Dmat = simulation50.EC50;
E2IC = (simulation50.E2ICs)';
[nE2s,nLyns,nruns] = size(EC50_3Dmat);
for idLyn = 1:nLyns
    EC50_2Dmat_eachLyn   = [];
    for idrun = 1:nruns
        EC50_eachrun_eachLyn = EC50_3Dmat(:,idLyn,idrun);
        EC50_2Dmat_eachLyn   = [EC50_2Dmat_eachLyn;EC50_eachrun_eachLyn'];
        figure(idLyn)
        plot(E2IC,EC50_eachrun_eachLyn)
        hold on       
        xlabel('E2IC')
        ylabel('EC50')
    end
    %EC50_2Dmat_eachLyn   = EC50_3Dmat(:,idLyn,:);
    mean_EC50eachrunLyn  = mean(EC50_2Dmat_eachLyn);
    var_EC50eachrunLyn   = var(EC50_2Dmat_eachLyn);
    %inter = iqr(EC50_2Dmat_eachLyn); % interquartiles (values between 25th and 75th quartiles)
    figure(idLyn)
    plot(E2IC, mean_EC50eachrunLyn,'k-','LineWidth',3)
    hold on 
    plot(E2IC, mean_EC50eachrunLyn+sqrt(var_EC50eachrunLyn),'k-','LineWidth',3)
    hold on
    plot(E2IC, mean_EC50eachrunLyn-sqrt(var_EC50eachrunLyn),'k-','LineWidth',3)
end


