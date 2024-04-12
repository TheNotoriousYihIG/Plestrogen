pos = [2,4.5,6,4.5];
pcols = {1/255*[0,196,255],1/255*[225,12,62],1/255*[55,176,116],1/255*[244,201,107],1/255*[149,52,235],1/255*[176,176,176]};
load('Model_LHS.mat');
data = load('prcc_Model_LHS');
prcc = data.prcc;
pvalue = data.sign;
P1 = data.P1;
P2 = data.P2;
P3 = data.P3;
P4 = data.P4;
P5 = data.P5;
P6 = data.P6;
P7 = data.P7;


prclab={'1,1','1,5','1,10','5,1',' 5,5','5,10','10,1','10, 5','10,10'};
prctitles={'1,1','1,5','1,10','5,1',' 5,5','5,10','10,1','10, 5','10,10'};
PRCC_var={'a', '\mu', '\sigma','k_{2b}^+','k_{4b}^+','k_{5b}^+','k_{6b}^+'};% 

%% plot for A

xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
idx1  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx1(i,j) = P1(i,j,2)<0.05;
    end
end
figure(1)
h = heatmap(xvalues, yvalues,  squeeze(P1(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("A")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'A');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')
  
 
%%
% plot for mu

xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
idx2  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx2(i,j) = P2(i,j,2)<0.05;
    end
end
h = heatmap(xvalues, yvalues,  squeeze(P2(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("\mu")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'mu');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')


% plot for sig
idx3  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx3(i,j) = P3(i,j,2)<0.05;
    end
end
xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
h = heatmap(xvalues, yvalues,  squeeze(P3(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("\sigma")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'sig');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')


% plot for k2
idx4  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx4(i,j) = P4(i,j,2)<0.05;
    end
end
xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
h = heatmap(xvalues, yvalues,  squeeze(P4(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("k_2")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'k2');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')

% plot for k4
idx5  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx5(i,j) = P5(i,j,2)<0.05;
    end
end
xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
h = heatmap(xvalues, yvalues,  squeeze(P5(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("k_4")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'k4');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')

% plot for k5
idx6  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx6(i,j) = P6(i,j,2)<0.05;
    end
end
xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
h = heatmap(xvalues, yvalues,  squeeze(P6(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("k_5")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'k5');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')

% plot for sig
idx7  = zeros(11,10);
for i = 1:11
    for j = 1:10
        idx7(i,j) = P7(i,j,2)<0.05;
    end
end
xvalues= string(round(RICs,2));
yvalues =string(round(E2ICs,2));
h = heatmap(xvalues, yvalues,  squeeze(P7(:,:,1)),'CellLabelColor','none','GridVisible','off','Colormap',turbo);
caxis([-1 1]); 
h.XLabel = "Concentration of receptor bound to Lyn";
h.YLabel = 'Estrogen';
title("k_6")
set(gca,'Fontsize',14)
pathname=fileparts('/Users/dengxiaoyan/Desktop/Estrogen/Plot/');
figfile = fullfile(pathname,'k6');
set(gcf, 'PaperPositionMode', 'manual'); 
set(gcf, 'PaperUnits', 'centimeters'); 
set(gcf, 'PaperPosition', [0 0  14 12]); 
set(gcf, 'PaperSize', [14 12]);
saveas(gcf,figfile,'pdf')

