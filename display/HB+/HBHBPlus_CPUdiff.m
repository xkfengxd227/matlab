%% CPU response time diff percent between HB and HB+
% some common config
linesolid = ['-ks'; '-ro'; '-g^'; '-cv'; '-md'; '-ko';'-rv'];
linedashed = [':ks'; ':ro'; ':g^'; ':cv'; ':md'; ':ko';':rv'];
hold on;
box on;
set(gcf,'Position',[100 100 1400, 720]);
y =100 * [...
    0.296470588,0.232222222,0.148954704,0.102180685,0.098810613;...
    0.25718111,0.254537988,0.226666667,0.218156686,0.193477865;...
    0.57773981,0.584302629,0.576996497,0.541583599,0.5556984];

% Corel
subplot(2,3,1);
x_nk = [40:40:200];
plot(...
    x_nk, y(1,:), linesolid(4,:),...
    'LineWidth', 1.5, 'MarkerSize', 7);
title('Corel', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('CPU response time diff(%)');
h=legend('alpha=0.08');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([min(x_nk), max(x_nk), 0, 80]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [0:20:80]);

% Aerial
subplot(2,3,2);
x_nk = [300:100:700];
plot(...
    x_nk, y(2,:), linesolid(3,:),...
    'LineWidth', 1.5, 'MarkerSize', 7);
title('Aerial', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('CPU response time diff(%)');
h=legend('alpha=0.06');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([min(x_nk), max(x_nk), 0, 80]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [0:20:80]);

% WT
subplot(2,3,3);
x_nk = [800:200:1600];
plot(...
    x_nk, y(3,:), linesolid(2,:),...
    'LineWidth', 1.5, 'MarkerSize', 7);
title('WT', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('CPU response time diff(%)');
h=legend('alpha=0.04');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([min(x_nk), max(x_nk), 0, 80]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [0:20:80]);