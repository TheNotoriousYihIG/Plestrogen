close all
clear variables

file_to_load = 0;
%0 - 3000 data point file on Aug 21

alpha = 0.05;

switch file_to_load
    case 0
        file_title='prcc_Model_LHS';
        load([file_title(6:end),'.mat']);
 %EC50 = EC50(:,:,1:19);
% LHSmatrix = LHSmatrix(1:19,:);
        
end
P1 = zeros(11,10, 2);%A
P2 = zeros(11,10, 2);%mu
P3 = zeros(11,10, 2);%sig
P4 = zeros(11,10, 2);%k2
P5 = zeros(11,10, 2);%k4
P6 = zeros(11,10, 2);%k5
P7 = zeros(11,10, 2);%k6

%%
for i = 1:11
    for j = 1:10
        [prcc,sign,sign_label]=PRCC(LHSmatrix,EC50(i,j,:),1,PRCC_var,alpha);
        P1(i,j,1)=prcc(1);
        P2(i,j,1)=prcc(2);
        P3(i,j,1)=prcc(3);
        P4(i,j,1)=prcc(4);
        P5(i,j,1)=prcc(5);
        P6(i,j,1)=prcc(6);
        P7(i,j,1)=prcc(7);
  
        P1(i,j,2)=sign(1);
        P2(i,j,2)=sign(2);
        P3(i,j,2)=sign(3);
        P4(i,j,2)=sign(4);
        P5(i,j,2)=sign(5);
        P6(i,j,2)=sign(6);
        P7(i,j,2)=sign(7);
    end
end
%%
save(file_title,'prcc','sign','sign_label','PRCC_var','P1','P2','P3','P4','P5','P6','P7');



