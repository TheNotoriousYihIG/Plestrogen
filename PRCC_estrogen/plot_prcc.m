pos = [2,4.5,6,4.5];
pcols = {1/255*[0,196,255],1/255*[225,12,62],1/255*[55,176,116],1/255*[244,201,107],1/255*[149,52,235],1/255*[176,176,176]};
load('Model_LHS.mat');
data = load('prcc_Model_LHS');
prcc = data.prcc;
pvalue = data.sign;
            prclab={'peak_A1','peak_A2','peak_time1','peak_time2',' auc_A1','auc_A2','auc_total'};
            prctitles={'Antibody peak1','Antibody peak2','Peak time1','Peak time 2','AUC 1','AUC 2',' AUC total'};
            PRCC_var={'\delta_{lv}','d_l','d_v','\delta_{tv}','d_t','d_b','\delta_{bt}','\delta_{bi}','\rho_b',...
    '\rho_{gb}','p_b','d_{gb}','p_p','d_p','\delta_{sp}','d_{sp}','d_m','p_m','\rho_m','EC_{50,Th}','ht',...
    '\alpha_{p}','\alpha_b','d_a', '\delta_{hi}','d_i','EC_{50,I}','\delta_{ib}'};%
  %
             for k=1:length(prcc)
            % for k=1:3
             PRCC_var={'\delta_{lv}','d_l','d_v','\delta_{tv}','d_t','d_b','\delta_{bt}','\delta_{bi}','\rho_b',...
    '\rho_{gb}','p_b','d_{gb}','p_p','d_p','\delta_{sp}','d_{sp}','d_m','p_m','\rho_m','EC_{50,Th}','ht',...
    '\alpha_{p}','\alpha_b','d_a', '\delta_{hi}','d_i','EC_{50,I}','\delta_{ib}'};%
  
                fig(k) = figure;
                idx = pvalue{1,1}<0.05;
                prcc{k} = prcc{k}(idx);
                PRCC_var = PRCC_var(idx);               
                b=barh(prcc{k}(end,:),'FaceColor','flat','EdgeColor','none');
                b.CData = kron(ones(length(prcc{k}(end,:)),1),[130,172,138]/255);
                hold off
                yticks([1:1:length(idx)])
                yticklabels(PRCC_var);
                box off
                set(gca,'Fontsize',14)
                xlim([-1.01,1.01]);
                %figprop(k).ax = gca;
                %figprop(k).title=title(prctitles{k},'FontSize', fontSize2,'fontname','times');
                %figprop(k).fnt_size=12;
                %figprop(k).Position = [10 10 550 4000];
                pathname=fileparts('/Users/dengxiaoyan/Desktop/PhD projects/Humoral immune response/Paper_new/Code/Matlab/Plot/');
                figfile = fullfile(pathname,num2str(k));
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  7 15]); 
set(gcf, 'PaperSize', [7 15]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(fig(k),figfile,'pdf')
             end
%%
figure(1)
b1 =bar(prcc{1}(end,:),'FaceColor','flat','EdgeColor','none');
b1.CData = kron(ones(length(prcc{1}(end,:)),1),[130,172,138]/255);
hold on
b2 =bar(prcc{2}(end,:),'FaceColor','flat','EdgeColor','none');
b2.CData = kron(ones(length(prcc{2}(end,:)),1),[166,129,178]/255);
hold off
%ax=gca;
%ax.XAxis.LineWidth = 3;
%ax.YAxis.LineWidth = 3;
%ax.FontSize = 20;
box off
legend('1st dose','2nd dose')
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28])
xticklabels(PRCC_var);
set(gca,'fontsize',8) 
ylim([-1.01,1.01]);
pathname=fileparts('/Users/dengxiaoyan/Desktop/PhD projects/Humoral immune response/Paper_new/Code/Matlab/Plot/');
figfile = fullfile(pathname,'peak');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  15 6]); 
set(gcf, 'PaperSize', [15 6]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gca,figfile,'pdf')
%%
figure(2)
b =bar(prcc{3}(end,:),'FaceColor','flat','EdgeColor','none');
b.CData = kron(ones(length(prcc{4}(end,:)),1),[130,172,138]/255);
hold on
b =bar(prcc{4}(end,:),'FaceColor','flat','EdgeColor','none');
b.CData = kron(ones(length(prcc{4}(end,:)),1),[166,129,178]/255);
hold off
%ax=gca;
%ax.XAxis.LineWidth = 3;
%ax.YAxis.LineWidth = 3;
%ax.FontSize = 20;
box off
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28])
xticklabels(PRCC_var);
set(gca,'fontsize',8) 
ylim([-1.01,1.01]);
pathname=fileparts('/Users/dengxiaoyan/Desktop/PhD projects/Humoral immune response/Paper_new/Code/Matlab/Plot/');
figfile = fullfile(pathname,'timing');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  15 6]); 
set(gcf, 'PaperSize', [15 6]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gca,figfile,'pdf')

figure(3)
b =bar(prcc{5}(end,:),'FaceColor','flat','EdgeColor','none');
b.CData = kron(ones(length(prcc{5}(end,:)),1),[130,172,138]/255);
hold on
b =bar(prcc{6}(end,:),'FaceColor','flat','EdgeColor','none');
b.CData = kron(ones(length(prcc{6}(end,:)),1),[166,129,178]/255);
hold off
%ax=gca;
%ax.XAxis.LineWidth = 3;
%ax.YAxis.LineWidth = 3;
%ax.FontSize = 20;
box off
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28])
xticklabels(PRCC_var);
set(gca,'fontsize',8) 
ylim([-1.01,1.01]);
pathname=fileparts('/Users/dengxiaoyan/Desktop/PhD projects/Humoral immune response/Paper_new/Code/Matlab/Plot/');
figfile = fullfile(pathname,'AUC');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  15 6]); 
set(gcf, 'PaperSize', [15 6]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gca,figfile,'pdf')
   
     %%       
     pathname=fileparts('/Users/dengxiaoyan/Desktop/PhD projects/Humoral immune response/Paper_new/Code/Matlab/Plot/');

prcc1 = data.prcc{1,1};
prcc2 = data.prcc{1,2};
prcc3 = data.prcc{1,3};
prcc4 = data.prcc{1,4};
prcc5 = data.prcc{1,5};
prcc6 = data.prcc{1,6};
prcc7 = data.prcc{1,7};
%
idx1 = find(abs(prcc1)>0.5);
idx2 = find(abs(prcc2)>0.5);
idx3 = find(abs(prcc3)>0.5);
idx4 = find(abs(prcc4)>0.5);
idx5 = find(abs(prcc5)>0.5);
idx6 = find(abs(prcc6)>0.5);
idx7 = find(abs(prcc7)>0.5);

label1 = PRCC_var(idx1);
label2 = PRCC_var(idx2);
label3 = PRCC_var(idx3);
label4 = PRCC_var(idx4);
label5 = PRCC_var(idx5);
label6 = PRCC_var(idx6);
label7 = PRCC_var(idx7);


value1 = prcc2(idx1);
value2 = prcc2(idx2);
value3 = prcc2(idx3);
value4 = prcc2(idx4);
value5 = prcc2(idx5);
value6 = prcc2(idx6);
value7 = prcc2(idx7);

figure(1)
for i = 1:length(value1)
    if value1(i)>0
         scatter(i,1, 1500*abs(value1(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value1(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7])
xlim([0.5 7.5])
xticklabels(label1);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_peak_a1');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))

saveas(gcf,figfile,'pdf')

figure(2)
for i = 1:length(value2)
    if value2(i)>0
         scatter(i,1, 1500*abs(value2(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value2(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7])
xlim([0.5 7.5])
xticklabels(label2);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_peak_a2');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gcf,figfile,'pdf')


figure(3)
for i = 1:length(value3)
    if value3(i)>0
         scatter(i,1, 1500*abs(value3(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value3(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7])
xlim([0.5 7.5])
xticklabels(label3);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_time_a1');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gcf,figfile,'pdf')


figure(4)
for i = 1:length(value4)
    if value4(i)>0
         scatter(i,1, 1500*abs(value4(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value4(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7])
xlim([0.5 7.5])
xticklabels(label4);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_time_a2');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gcf,figfile,'pdf')


figure(5)
for i = 1:length(value5)
    if value5(i)>0
         scatter(i,1, 1500*abs(value5(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value5(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7 ])
xlim([0.5 7.5])
xticklabels(label5);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_auc_a1');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gcf,figfile,'pdf')

figure(6)
for i = 1:length(value6)
    if value6(i)>0
         scatter(i,1, 1500*abs(value6(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value6(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7 ])
xlim([0.5 7.5])
xticklabels(label6);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_auc_a2');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gcf,figfile,'pdf')

figure(5)
for i = 1:length(value7)
    if value7(i)>0
         scatter(i,1, 1500*abs(value7(i)),'square', 'filled','MarkerFaceColor', '#C04252','MarkerEdgeColor','none')
    else
        scatter(i,1, 1500*abs(value7(i)),'square', 'filled', 'MarkerFaceColor','#375391','MarkerEdgeColor','none')
    end
 hold on
end
xticks([1 2 3 4 5 6 7 ])
xlim([0.5 7.5])
xticklabels(label7);
set(gca,'YColor','none')
box off
set(gca,'Fontsize',12)
figfile = fullfile(pathname,'prcc_auc_total');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0 8 3]); 
set(gcf, 'PaperSize', [8 3]);
set(gca, 'LooseInset', get(gca,'TightInset'))
saveas(gcf,figfile,'pdf')
          

            