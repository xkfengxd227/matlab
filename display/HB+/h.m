%% depict the performance comparison between SK-LSH and SK-LSH-CK: h
% some common config
line1 = ['--rv'; '--gs'; '--cd'; '--bo'; '--m*'; '--ks'];
line2 = ['-rv'; '-gs'; '-cd'; '-bo'; '-m*'; '-ks'];
hold on;
box on;
grid on;

%% Corel
% ratio
subplot(2,4,1);
x_h = [2:1:6];
y_ratio = [1.13976,1.101810,1.083015,1.071544,1.064905];
y_ratio_adv = [1.093691,1.080077,1.074140,1.070769,1.069440];

plot(...
        x_h, y_ratio(1,:)', line1(6,:), ...
		x_h, y_ratio_adv(1,:)', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('Corel', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('L');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,5);
x_h = [2:1:6];
y_ratio = [0.7535,0.8303,0.8689,0.89,0.9013];
y_ratio_adv = [0.9098,0.9486,0.9657,0.9735,0.9795];

plot(...
        x_h, y_ratio(1,:)', line1(6,:), ...
		x_h, y_ratio_adv(1,:)', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

xlabel('L');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [0:0.2:1]);


%% Aerial
% ratio
subplot(2,4,2);
x_h = [2:1:6];
y_ratio = [1.180436,1.154224,1.135545,1.127382,1.122650];
y_ratio_adv = [1.120404,1.113704,1.103785,1.097758,1.094363];

plot(...
		x_h, y_ratio', line1(6,:), ...
        x_h, y_ratio_adv', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('Aerial', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('L');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,6);
x_h = [2:1:6];
y_ratio = [0.41,0.4738,0.5293,0.5631,0.5825];
y_ratio_adv = [0.6798,0.7408,0.7875,0.8214,0.8385];

plot(...
		x_h, y_ratio', line1(6,:), ...
        x_h, y_ratio_adv', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

xlabel('L');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [0:0.2:1]);


%% SIFT
% ratio
subplot(2,4,3);
x_h = [2:1:6];
y_ratio = [1.210593,1.183064,1.171399,1.164028,1.161307];
y_ratio_adv = [1.139086,1.122468,1.116247,1.109271,1.106524];

plot(...
		 x_h, y_ratio', line1(6,:), ...
        x_h, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

title('SIFT', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('L');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,7);
x_h = [2:1:6];
y_ratio = [0.151,0.201,0.228,0.249,0.267];
y_ratio_adv = [0.35,0.396,0.419,0.443,0.513];

plot(...
        x_h, y_ratio', line1(6,:), ...
        x_h, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

xlabel('L');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [0:0.2:1]);


%% Audio
% ratio
subplot(2,4,4);
x_h = [2:1:6];
y_ratio = [1.149588,1.126709,1.110201,1.102385,1.094585];
y_ratio_adv = [1.058027,1.050406,1.043424,1.039400,1.037553];

plot(...
		x_h, y_ratio', line1(6,:), ...
		x_h, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

title('Audio', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('L');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,1,1.4]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [1:0.1:1.4]);


% recall@100
subplot(2,4,8);
x_h = [2:1:6];
y_ratio = [0.4489,0.5148,0.5775,0.6104,0.6396];
y_ratio_adv = [0.7526,0.7987,0.8483,0.8814,0.8995];

plot(...
        x_h, y_ratio', line1(6,:), ...
		x_h, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

xlabel('L');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
        
axis([2,6,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [0:0.2:1]);

