%% depict the performance comparison between SK-LSH and SK-LSH-CK
% divide sub figure

% some common config
line1 = ['--rv'; '--gs'; '--cd'; '--bo'; '--m*'; '--gs'];
line2 = ['-rv'; '-gs'; '-cd'; '-bo'; '-m*'; '-gs'];
figure_FontSize=10;

hold on;

%% Corel
% ratio
subplot(2,4,1);

x_m = [4:4:20]';
y1 = [1.581718, 1.285933, 1.249016, 1.244867, 1.245978]';
y2 = [1.154772, 1.136868, 1.137554, 1.134341, 1.13777]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('ratio');
hl = legend('SK-LSH', 'SK-LSH-64');
set(hl, 'Fontname', 'Helvetica');
title('Corel', 'FontAngle', 'Italic');
axis([4,20,1,1.4]);

set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [1:0.1:1.4]);


% recall
subplot(2,4,5);

x_m = [4:4:20]';
y1 = [0.2995, 0.5418, 0.6038, 0.6075, 0.6022]';
y2 = [0.7599, 0.7948, 0.7931, 0.7652, 0.799]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
title('Corel', 'FontAngle', 'Italic');
axis([4,20,0,1]);
set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [0:0.2:1]);

%% Aerial
% ratio
subplot(2,4,2);

x_m = [10:10:50]';
y1 = [1.304854, 1.252925, 1.243078, 1.230384, 1.233827]';
y2 = [1.173299, 1.163369, 1.164691, 1.165087, 1.162952]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
title('Aerial', 'FontAngle', 'Italic');
axis([10,50, 1,1.4]);

set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [1:0.1:1.4]);

% recall
subplot(2,4,6);

x_m = [10:10:50]';
y1 = [0.2444, 0.3026, 0.3153, 0.3267, 0.3271]';
y2 = [0.5212, 0.5257, 0.5339, 0.5276, 0.5359]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
title('Aerial', 'FontAngle', 'Italic');
axis([10,50,0,1]);
set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [0:0.2:1]);


%% sift_1M
% ratio
subplot(2,4,3);

x_m = [20:10:60]';
y1 = [1.242984, 1.246193, 1.242206, 1.242124, 1.241504]';
y2 = [1.164532, 1.162955, 1.166155, 1.166009, 1.167549]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
title('SIFT', 'FontAngle', 'Italic');
axis([20,60, 1,1.4]);

set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [1:0.1:1.4]);

% recall
subplot(2,4,7);

x_m = [20:10:60]';
y1 = [0.1239, 0.1238, 0.1217, 0.1197, 0.1217]';
y2 = [0.2561, 0.2522, 0.2542, 0.2579, 0.245]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
title('SIFT', 'FontAngle', 'Italic');
axis([20,60,0,1]);
set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [0:0.2:1]);

%% audio
% ratio
subplot(2,4,4);

x_m = [10:10:50]';
y1 = [1.204183,1.183639,1.194266,1.190805,1.195041]';
y2 = [1.087324,1.093267,1.0796,1.084618,1.0945]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('ratio');
legend('SK-LSH', 'SK-LSH-64');
title('Audio', 'FontAngle', 'Italic');
axis([10,50, 1,1.4]);

set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [1:0.1:1.4]);

% recall
subplot(2,4,8);

x_m = [10:10:50]';
y1 = [0.34,0.376,0.35,0.334,0.349]';
y2 = [0.601,0.593,0.629,0.645,0.547]';
plot(x_m, y1, line1(6,:), x_m, y2, line2(1,:), 'LineWidth',1.5, 'MarkerSize',8);

xlabel('m');
ylabel('recall@100');
legend('SK-LSH', 'SK-LSH-64');
title('Audio', 'FontAngle', 'Italic');
axis([10,50,0,1]);
set(get(gca,'XLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',12, 'FontAngle', 'Italic', 'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
set(gca, 'Fontname', 'Helvetica', 'Fontsize', 10);
set(gcf,'Position',[30 10 1440 600]);
set(gca, 'XTick', x_m');
set(gca, 'YTick', [0:0.2:1]);
