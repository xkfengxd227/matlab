%% depict the performance comparison between HB, HB+, VA-File, iDistance
% some common config
linesolid = ['-r+'; '-bx'; '-gs'; '-k^'; '-m*';];
linedashed = [':r+'; ':bx'; ':gs'; ':k^'; ':m*';];
% line1=['-r+'; '-bx']; 
hold on;
box on;
% grid on;

%% Corel
% ratio
subplot(1,1,1);
x_h = [1:3:10];
y_io = [...
    55.3,77.8,95.8,113.8;...
    516.5,544.5,569,592;...
    827,902.15,937.65,969.15;...
    1165.92,1282.92,1376.42,1461.92;];

plot(...
        x_h, y_io(1,:), linesolid(1,:), ...
        x_h, y_io(2,:), linesolid(2,:), ...
        x_h, y_io(3,:), linesolid(3,:), ...
        x_h, y_io(4,:), linesolid(4,:), ...
        'LineWidth',1.5, 'MarkerSize',8);

title('VA-File', 'FontAngle', 'Italic', 'FontWeight', 'Bold');
xlabel('Cluster Number');
ylabel('I/O');
legend('Corel', 'Aerial', 'WT', 'CM55');
        
axis([1,10,3,1500]);
set(get(gca,'XLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Bold', 'Vertical','top');
set(get(gca,'YLabel'),'FontSize',10, 'FontAngle', 'Italic', 'FontWeight', 'Bold', 'Vertical','middle');
set(gcf,'Position',[10 10 550, 400]);
% set(gca, 'Fontname', 'Helvetica',  'FontSize',10);
set(gca, 'XTick', x_h');
set(gca, 'YTick', [0:500:1500]);