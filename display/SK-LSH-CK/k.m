%% depict the performance comparison between SK-LSH and SK-LSH-CK: k
% some common config
line1 = ['--ro'; '--gs'; '--cd'; '--bo'; '--m*'; '--ks'];
line2 = ['-ro'; '-gs'; '-cd'; '-bo'; '-m*'; '-ks'];
hold on;
box on;

%% Corel
% ratio
subplot(2,4,1);
x_k = [1,10:10:100];
y_ratio = [1.024747,1.041981,1.052841,1.061006,1.069211,1.076433,1.081809,1.087657,1.092716,1.09883,1.101539];
y_ratio_adv = [1.398490,1.178375,1.138283,1.122399,1.109327,1.101327,1.093798,1.08947,1.085029,1.083341,1.079398];

plot(...
        x_k, y_ratio(1,:)', line1(6,:), ...
		x_k, y_ratio_adv(1,:)', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('Corel', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('k');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,1,1.2]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [1:0.05:1.2]);


% recall@100
subplot(2,4,5);
x_k = [1,10:10:100];
y_ratio = [0.8321,0.8267,0.8208,0.831,0.8281,0.827,0.8254,0.8242,0.8228,0.8272,0.8233];
y_ratio_adv = [0.393,0.8243,0.8893,0.9123,0.9215,0.9331,0.937,0.9437,0.946,0.9447,0.9454];

plot(...
        x_k, y_ratio(1,:)', line1(6,:), ...
		x_k, y_ratio_adv(1,:)', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

xlabel('k');
ylabel('recall@k');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [0:0.2:1]);


%% Aerial
% ratio
subplot(2,4,2);
x_k = [1,10:10:100];
y_ratio = [1.076014,1.104326,1.118312,1.128504,1.136923,1.144166,1.150691,1.156669,1.162248,1.167548,1.172617];
y_ratio_adv = [1.166192,1.132077,1.119865,1.114461,1.111285,1.108998,1.107525,1.106435,1.105784,1.105518,1.105526];

plot(...
		x_k, y_ratio', line1(6,:), ...
        x_k, y_ratio_adv', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('Aerial', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('k');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,1,1.2]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [1:0.05:1.2]);


% recall@100
subplot(2,4,6);
x_k = [1,10:10:100];
y_ratio = [0.446,0.446,0.446,0.446,0.446,0.446,0.446,0.446,0.446,0.446,0.446];
y_ratio_adv = [0.325,0.643,0.682,0.713,0.722,0.73,0.736,0.738,0.742,0.743,0.746];

plot(...
		x_k, y_ratio', line1(6,:), ...
        x_k, y_ratio_adv', line2(1,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

xlabel('k');
ylabel('recall@k');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [0:0.2:1]);


%% SIFT
% ratio
subplot(2,4,3);
x_k = [1,10:10:100];
y_ratio = [1.122655,1.131310,1.140772,1.148905,1.155885,1.161938,1.167323,1.172248,1.176796,1.181038,1.18502];
y_ratio_adv = [1.157938,1.128820,1.124362,1.123122,1.122562,1.122255,1.122387,1.122383,1.122778,1.123157,1.122204];

plot(...
		 x_k, y_ratio', line1(6,:), ...
        x_k, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

title('SIFT', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('k');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,1,1.2]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [1:0.05:1.2]);


% recall@100
subplot(2,4,7);
x_k = [1,10:10:100];
y_ratio = [0.197,0.199,0.199,0.199,0.199,0.199,0.199,0.199,0.199,0.199,0.199];
y_ratio_adv = [0.172,0.343,0.36,0.374,0.381,0.383,0.385,0.386,0.389,0.391,0.391];

plot(...
        x_k, y_ratio', line1(6,:), ...
        x_k, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

xlabel('k');
ylabel('recall@k');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [0:0.2:1]);


%% Audio
% ratio
subplot(2,4,4);
x_k = [1,10:10:100];
y_ratio = [1.051881,1.071530,1.081728,1.091709,1.097393,1.103617,1.10723,1.112635,1.118226,1.120964,1.123569];
y_ratio_adv = [1.069023,1.053836,1.050015,1.049184,1.048345,1.048088,1.047749,1.048483,1.049283,1.048685,1.04918];

plot(...
		x_k, y_ratio', line1(6,:), ...
		x_k, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

title('Audio', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('k');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,1,1.2]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [1:0.05:1.2]);


% recall@100
subplot(2,4,8);
x_k = [1,10:10:100];
y_ratio = [0.5201,0.5216,0.5097,0.5066,0.5229,0.5093,0.5136,0.5188,0.5093,0.514,0.528];
y_ratio_adv = [0.4042,0.7780,0.802,0.8099,0.8140,0.8183,0.8194,0.8147,0.8074,0.8153,0.8152];

plot(...
        x_k, y_ratio', line1(6,:), ...
		x_k, y_ratio_adv', line2(1,:), ...
		'LineWidth',1.5, 'MarkerSize',8);

xlabel('k');
ylabel('recall@k');
legend('SK-LSH', 'SK-LSH-64');
        
axis([1,100,0,1]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gcf,'Position',[10 10 1600 600]);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [0:0.2:1]);

