%% tuning m for I/O and CPU in all data dataset
% some common config
linesolid = ['-ks'; '-ro'; '-g^'; '-cv'; '-md';];
linedashed = [':ks'; ':ro'; ':g^'; ':cv'; ':md';];
% line1=['-r+'; '-bx']; 
hold on;
box on;
% grid on;
set(gcf,'Position',[100 100 1400, 720]);

%% I/O cost
% Corel
subplot(2,3,1);
x_nk = [40:40:200];
y_io = [...
    30,25,24,24,26;...
    26,23,21,22,24;...
    25,22,21,22,23;...
    25,22,21,22,23;...
    25,22,21,22,23];

plot(...
        x_nk, y_io(1,:), linesolid(1,:), ...
        x_nk, y_io(2,:), linesolid(2,:), ...
        x_nk, y_io(3,:), linesolid(3,:), ...
        x_nk, y_io(4,:), linesolid(4,:), ...
        x_nk, y_io(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);

title('Corel', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('I/O');
h=legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([40,200, 15, 35]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [15:5:35]);

% Aerial
subplot(2,3,2);
x_nk = [300:100:700];
y_io = [...
    132,128,128,128,129;...
    128,124,126,126,129;...
    128,125,126,126,129;...
    128,125,126,126,129;...
    128,125,126,126,129];

plot(...
        x_nk, y_io(1,:), linesolid(1,:), ...
        x_nk, y_io(2,:), linesolid(2,:), ...
        x_nk, y_io(3,:), linesolid(3,:), ...
        x_nk, y_io(4,:), linesolid(4,:), ...
        x_nk, y_io(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);

title('Aerial', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('I/O');
h=legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([300, 700, 120, 140]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [120:5:140]);

% WT
subplot(2,3,3);
x_nk = [800:200:1600];
y_io = [...
    240,234,233,236,238;...
    238,234,233,236,237;...
    238,234,233,236,237;...
    238,234,233,236,237;...
    238,234,233,236,237];

plot(...
        x_nk, y_io(1,:), linesolid(1,:), ...
        x_nk, y_io(2,:), linesolid(2,:), ...
        x_nk, y_io(3,:), linesolid(3,:), ...
        x_nk, y_io(4,:), linesolid(4,:), ...
        x_nk, y_io(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);

title('WT', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('I/O');
h=legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
set(h, 'EdgeColor', 'White', 'Location', 'NorthEast');
axis([800, 1600, 230, 250]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [230:5:250]);

%% CPU response time
% Corel
subplot(2,3,4);
x_nk = [40:40:200];
y = [...
    676,693,936,1353,1877;...
    603,662,905,1298,1814;...
    599,663,913,1313,1820;...
    592,664,929,1323,1864;...
    594,668,940,1358,1909];
plot(...
        x_nk, y(1,:), linesolid(1,:), ...
        x_nk, y(2,:), linesolid(2,:), ...
        x_nk, y(3,:), linesolid(3,:), ...
        x_nk, y(4,:), linesolid(4,:), ...
        x_nk, y(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);
% title('Corel', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('CPU response time(ms)');
h=legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
set(h, 'EdgeColor', 'White', 'Location', 'NorthWest');
axis([min(x_nk), max(x_nk), 400, 2000]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [400:400:2000]);

% Aerial
subplot(2,3,5);
x_nk = [300:100:700];
y = [...
    6317,8722,12733,19297,24616;...
    6184,9076,13035,17604,25680;...
    5970,8983,14510,18606,26470;...
    6362,9105,13572,18930,24602;...
    6533,9018,13800,19045,26569];
plot(...
        x_nk, y(1,:), linesolid(1,:), ...
        x_nk, y(2,:), linesolid(2,:), ...
        x_nk, y(3,:), linesolid(3,:), ...
        x_nk, y(4,:), linesolid(4,:), ...
        x_nk, y(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);
%title('Aerial', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('CPU response time(ms)');
h=legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
set(h, 'EdgeColor', 'White', 'Location', 'NorthWest');
axis([min(x_nk), max(x_nk), 5000, 30000]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [5000:5000:30000]);

% WT
subplot(2,3,6);
x_nk = [800:200:1600];
y = [...
    39083,62458,89511,110019,145045;...
    37928,61189,80307,119070,155206;...
    38206,61648,86970,118482,152940;...
    40168,59485,82798,117385,161572;...
    41998,64102,92484,130636,169322];
plot(...
        x_nk, y(1,:), linesolid(1,:), ...
        x_nk, y(2,:), linesolid(2,:), ...
        x_nk, y(3,:), linesolid(3,:), ...
        x_nk, y(4,:), linesolid(4,:), ...
        x_nk, y(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);
%title('WT', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('K');
ylabel('CPU response time(ms)');
h=legend('m=1', 'm=2', 'm=3', 'm=4', 'm=5');
set(h, 'EdgeColor', 'White', 'Location', 'NorthWest');
axis([min(x_nk), max(x_nk), 30000, 180000]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_nk');
set(gca, 'YTick', [30000:50000:180000]);