%% depict the performance of varies L on SK-LSH-2 on 4 data sets
% some common config
line2 = ['--ks'; '--r^'; '--g*'; '--cs'; '--ms'; '--ks'];
line1 = ['-ks'; '-r^'; '-g*'; '-cs'; '-ms'; '-ks'];
lineWidth = 1.0;
markerSize = 6;
position = [10 10 1600 550];

%% Corel, Aerial
% ratio against m
x_np = [2,3,4,5,6,8,10];
y_ratio = [
    1.049086,1.036045,1.028737,1.025176,1.022281,1.020391,1.018887;...
	1.10261,1.088246,1.079287,1.07461,1.071831,1.065113,1.063194;...
    1.14136,1.12657,1.11743,1.11205,1.104917,1.0986,1.093267;...
    1.066954,1.062364,1.058448,1.060454,1.060402,1.0589,1.06069];
y_art = [
    0.426469,0.429699,0.43614,0.475083,0.470157,0.44069,0.498005;...
    0.934747,0.879276,0.800466,0.864891,0.820519,0.837332,0.916567;...
    1.020164,1.048984,1.035907,1.056279,1.073743,1.104449,1.149894;...
    0.656488,0.671975,0.672142,0.688064,0.695049,0.686734,0.683601];

subplot(2,4,1);
hold on;
box on;
plot(...
        x_np, y_ratio(1,:), line1(1,:),...
        x_np, y_ratio(2,:), line1(2,:),...
        x_np, y_ratio(3,:), line1(3,:),...
        x_np, y_ratio(4,:), line1(4,:),...
        'LineWidth',lineWidth, 'MarkerSize',markerSize);

title('$ratio$', 'Fontname', 'Helvetica', 'FontWeight', 'Bold', 'Interpreter', 'latex');
xlabel('$L$');
ylabel('$ratio$');
legend('Corel','Aerial', 'Sift', 'Audio');
        
axis([min(x_np), max(x_np), 1.0, 1.2]);
set(get(gca,'XLabel'),'FontSize',12, 'Vertical','top', 'Interpreter', 'latex');
set(get(gca,'YLabel'),'FontSize',12, 'Vertical','baseline', 'Interpreter', 'latex');
set(gcf,'Position', position);
set(gca, 'XTick', [x_np]);
set(gca, 'YTick', [1.0:0.05:1.2]);

% art against np
subplot(2,4,2);
hold on;
box on;
plot(...
        x_np, y_art(1,:), line1(1,:),...
        x_np, y_art(2,:), line1(2,:),...
        x_np, y_art(3,:), line1(3,:),...
        x_np, y_art(4,:), line1(4,:),...
        'LineWidth',lineWidth, 'MarkerSize',markerSize);

title('$ART(ms)$', 'Fontname', 'Helvetica', 'FontWeight', 'Bold', 'Interpreter', 'latex');
xlabel('$L$');
ylabel('$ART(ms)$');
legend('Corel', 'Aerial', 'Sift', 'Audio', 'Location', 'NorthWest');
        
axis([min(x_np), max(x_np), 0, 2.5]);
set(get(gca,'XLabel'),'FontSize',12, 'Vertical','top', 'Interpreter', 'latex');
set(get(gca,'YLabel'),'FontSize',12, 'Vertical','baseline', 'Interpreter', 'latex');
set(gcf,'Position', position);
set(gca, 'XTick', [x_np]);
set(gca, 'YTick', [0:0.5:2.5]);