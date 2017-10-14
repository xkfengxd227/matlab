%% depict the performance comparison between HB, HB+, VA-File, iDistance
% some common config
line1 = ['-r+'; '--bx'; ':gr'; '-k^'; '--m*'];
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