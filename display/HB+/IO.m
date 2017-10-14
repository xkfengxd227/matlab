%% compare I/O between HB, HBPlus, VA-File, iDistance
% common configurations
linesolid = ['-ks'; '-ro'; '-g^'; '-cv'; '-md'; '-ko';'-rv';'-b+'];
linedashed = [':ks'; ':ro'; ':g^'; ':cv'; ':md'; ':ko';':rv';':b+'];
hold on;
box on;
set(gcf,'Position',[100 100 1400, 720]);
x_k = [10:30:100];

% Corel
subplot(2,3,1);
y_io = [...
    56, 79, 97, 115;...
    33,41,46,49;...
    57,153,225,284;...
    28,41,47,51;...
    21,32,38,42];
plot(...
        x_k, y_io(1,:), linesolid(1,:), ...
        x_k, y_io(2,:), linesolid(2,:), ...
        x_k, y_io(3,:), linesolid(8,:), ...
        x_k, y_io(4,:), linesolid(3,:), ...
        x_k, y_io(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);
title('Corel', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('k');
ylabel('I/O');
h=legend('VA-File', 'iDistance', 'FNN', 'HB', 'HB+');
set(h, 'EdgeColor', 'White', 'Location', 'NorthWest');
axis([min(x_k), max(x_k), 0, 400]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [0:100:400]);

% Aerial
subplot(2,3,2);
y_io = [...
    512,534,556,576;...
    491,548,574,593;...
    74,218,336,441;...
    154,193,214,231;...
    125,161,180,196];
plot(...
        x_k, y_io(1,:), linesolid(1,:), ...
        x_k, y_io(2,:), linesolid(2,:), ...
        x_k, y_io(3,:), linesolid(8,:), ...
        x_k, y_io(4,:), linesolid(3,:), ...
        x_k, y_io(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);
title('Aerial', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('k');
ylabel('I/O');
h=legend('VA-File', 'iDistance', 'FNN', 'HB', 'HB+');
set(h, 'EdgeColor', 'White', 'Location', 'NorthWest');
axis([min(x_k), max(x_k), 50, 600]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [50:100:600]);

%% I/O cost
% WT
subplot(2,3,3);
x_k = [10:30:100];
y_io = [...
    827,962,1033,1096;...
    1903,2014,2070,2109;...
    74,257,421,573;...
    287,362,400,428;...
    233,299,333,356];
plot(...
        x_k, y_io(1,:), linesolid(1,:), ...
        x_k, y_io(2,:), linesolid(2,:), ...
        x_k, y_io(3,:), linesolid(8,:), ...
        x_k, y_io(4,:), linesolid(3,:), ...
        x_k, y_io(5,:), linesolid(5,:), ...
        'LineWidth',1.5, 'MarkerSize',7);
title('WT', 'Fontname', 'Helvetica', 'FontAngle', 'Normal', 'FontWeight', 'Normal');
xlabel('k');
ylabel('I/O');
h=legend('VA-File', 'iDistance', 'FNN', 'HB', 'HB+');
set(h, 'EdgeColor', 'White', 'Location', 'NorthWest');
axis([min(x_k), max(x_k), 0, 2150]);
set(get(gca,'XLabel'),'FontSize',9, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Normal', 'Vertical','bottom');
set(gca, 'Fontname', 'Helvetica',  'FontSize',9);
set(gca, 'XTick', x_k');
set(gca, 'YTick', [0:500:2150]);