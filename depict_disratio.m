%% decipt the trend of error ratio on Corel, of code/vector, lb/vector, ub/vector
% some common config
line2 = ['--ks'; '--r^'; '--g*'; '--cs'; '--ms'; '--ks'];
line1 = ['-ks'; '-r^'; '-g*'; '-cs'; '-ms'; '-ks'];
lineWidth = 1.0;
markerSize = 6;
position = [10 10 1600 550];
global disratio;
n = 1000;
nq = size(disratio.cv, 2);

%% average on query
range_end = [50:50:1000];
avg_cv = [];
avg_lb = [];
avg_ub = [];
for i=1:20
    avg_cv = [avg_cv, mean(disratio.avg_cv(1:range_end(i)))];
    avg_lb = [avg_lb, mean(disratio.avg_lb(1:range_end(i)))];
    avg_ub = [avg_ub, mean(disratio.avg_ub(1:range_end(i)))];
end

subplot(1,2,1);
hold on;
box on;
plot(...
    range_end, avg_cv, '-ks',...
    range_end, avg_lb, '-ro',...
    range_end, avg_ub,'-g*',...
    'LineWidth',lineWidth, 'MarkerSize',markerSize);
legend('Code/Vector', 'LB', 'UB');
axis([min(range_end), max(range_end), 0, 1.5]);
set(get(gca,'XLabel'),'FontSize',12, 'Vertical','top', 'Interpreter', 'latex');
set(get(gca,'YLabel'),'FontSize',12, 'Vertical','baseline', 'Interpreter', 'latex');
set(gcf,'Position', position);
set(gca, 'XTick', [range_end]);
set(gca, 'YTick', [0:0.1:1.5]);

%% varies on 100nn
subplot(1,2,2);
range = [1:1:n];
hold on;
plot(...
    range, disratio.sortavg_cv(1:n,1), '-k',...
    range, disratio.sortavg_lb(1:n,1), '-r',...
    range, disratio.sortavg_ub(1:n,1),'-g',...
    'LineWidth',lineWidth, 'MarkerSize',markerSize);
axis([0, n, -0.5, 1.5]);
set(get(gca,'XLabel'),'FontSize',12, 'Vertical','top', 'Interpreter', 'latex');
set(get(gca,'YLabel'),'FontSize',12, 'Vertical','baseline', 'Interpreter', 'latex');
set(gcf,'Position', position);
set(gca, 'XTick', [0:100:n]);
set(gca, 'YTick', [-0.5:0.1:1.5]);
legend('Code/Vector', 'LB', 'UB');
    