%% depict the performance comparison between SK-LSH and SK-LSH-CK: npage
% some common config
line1 = ['--rv'; '--gs'; '--cd'; '--bo'; '--m*'; '--ks'];
line2 = ['-rv'; '-gs'; '-cd'; '-bo'; '-m*'; '-ks'];
hold on;
box on;
grid on;

%% Corel
% ratio
subplot(2,4,1);
x_npage = [5:5:30]';
y_ratio = [1.338705, 1.247896, 1.205647, 1.188254, 1.166391, 1.154034];
y_ratio_adv = [1.170183, 1.138095, 1.118232, 1.106550, 1.098784, 1.090709];

plot(...
        x_npage, y_ratio(1,:)', line1(6,:), ...
		x_npage, y_ratio_adv(1,:)', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('Corel', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('Np');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,5);
x_npage = [5:5:30]';
y_ratio = [0.5439,0.6027,0.6403,0.6623,0.6845,0.6922];
y_ratio_adv = [0.7364,0.7977,0.8362,0.8607,0.8796,0.9045];

plot(...
        x_npage, y_ratio(1,:)', line1(6,:), ...
		x_npage, y_ratio_adv(1,:)', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

xlabel('Np');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [0:0.2:1]);


%% Aerial
% ratio
subplot(2,4,2);
x_npage = [5:5:30]';
y_ratio = [1.326233,1.240888,1.206366,1.179801,1.165964,1.162314];
y_ratio_adv = [1.188390,1.154099,1.146489,1.140157,1.129947,1.129550];

plot(...
		x_npage, y_ratio', line1(6,:), ...
        x_npage, y_ratio_adv', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('Aerial', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('Np');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,6);
x_npage = [5:5:30]';
y_ratio = [0.256,0.307,0.3515,0.3814,0.4065,0.4264];
y_ratio_adv = [0.4633,0.5579,0.5821,0.603,0.6386,0.658];

plot(...
		x_npage, y_ratio', line1(6,:), ...
        x_npage, y_ratio_adv', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

xlabel('Np');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [0:0.2:1]);


%% SIFT
% ratio
subplot(2,4,3);
x_npage = [5:5:30]';
y_ratio = [1.29478, 1.244434, 1.227169, 1.210145, 1.198678, 1.17978];
y_ratio_adv = [1.19314, 1.165697, 1.152218, 1.146863, 1.136572, 1.125711];

plot(...
		 x_npage, y_ratio', line1(6,:), ...
        x_npage, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

title('SIFT', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('Np');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,7);
x_npage = [5:5:30]';
y_ratio = [0.098,0.1217,0.133,0.147,0.155,0.167];
y_ratio_adv = [0.2016,0.256,0.2836,0.316,0.331,0.38];

plot(...
        x_npage, y_ratio', line1(6,:), ...
        x_npage, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

xlabel('Np');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [0:0.2:1]);


%% Audio
% ratio
subplot(2,4,4);
x_npage = [5:5:30]';
y_ratio = [1.187278, 1.126568, 1.101692, 1.088115, 1.078767, 1.066715];
y_ratio_adv = [1.069405, 1.048949, 1.040882, 1.035313, 1.031427, 1.029407];

plot(...
		x_npage, y_ratio', line1(6,:), ...
		x_npage, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

title('Audio', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('Np');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,8);
x_npage = [5:5:30]';
y_ratio = [0.4325,0.5183,0.5759,0.5999,0.6205,0.6583];
y_ratio_adv = [0.7239,0.8103,0.8614,0.8889,0.9201,0.9328];

plot(...
        x_npage, y_ratio', line1(6,:), ...
		x_npage, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

xlabel('Np');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([5,30,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_npage');
set(gca, 'YTick', [0:0.2:1]);

