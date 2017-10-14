%% optimal I/O cost diff percent
% some common config
linesolid = ['-ks'; '-ro'; '-g^'; '-cv'; '-md'; '-ko';'-rv'];
linedashed = [':ks'; ':ro'; ':g^'; ':cv'; ':md'; ':ko';':rv'];
hold on;
box on;
set(gcf,'Position',[100 100 1400, 720]);

% Corel
subplot(2,3,1);
x_nk = [40:40:200];
y = [0.305555556,0.266666667,0.25,0.214285714,0.206896552];
plot(...
    x_nk, y(1,:)*100, linesolid(4,:),...
    'LineWidth',1.5, 'MarkerSize',7);
title('Corel', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('I/O diff(%)');
h=legend('alpha=0.08');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([40,200, 0, 40]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [0:10:40]);

% Aerial
subplot(2,3,2);
x_nk = [300:100:700];
y = [0.219512195,0.2,0.171052632,0.176470588,0.162337662];
plot(...
    x_nk, y*100, linesolid(3,:),...
    'LineWidth',1.5, 'MarkerSize',7);
title('Aerial', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('I/O diff(%)');
h=legend('alpha=0.06');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([300,700, 0, 40]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [0:10:40]);

% WT
subplot(2,3,3);
x_nk = [800:200:1600];
y = [0.209302326,0.189655172,0.18466899,0.18466899,0.174216028];
plot(...
    x_nk, y*100, linesolid(2,:),...
    'LineWidth',1.5, 'MarkerSize',7);
title('WT', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('I/O diff(%)');
h=legend('WT alpha=0.04');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([800, 1600, 0, 40]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [0:10:40]);
