close all;
% show projected points of all data points
set(gcf, 'Position', [10, 10, 800, 800]);
plot(Kv(1,:),Kv(2,:),'.');
title('project [Corel] onto 2 random dim');
xlabel('$e_1$', 'Interpreter', 'latex');
ylabel('$e_2$', 'Interpreter', 'latex');

grid on;
hold on;
axis([-1,1,-1,1]*0.4);
set(get(gca, 'xlabel'), 'fontsize', 14);
set(get(gca, 'ylabel'), 'fontsize', 14);
set(gca, 'XTick', [-0.5:0.1:0.5]);
set(gca, 'YTick', [-0.5:0.1:0.5]);
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');

% expand the line and draw
Ke1=Klbv(:,idl);
Ke2=Klev(:,idl);
syms lambda by
[lambda,by]=solve(lambda*Ke1+(1-lambda)*Ke2==[-0.4;by],lambda,by)
syms lambda ey
[lambda,ey]=solve(lambda*Ke1+(1-lambda)*Ke2==[0.4;ey],lambda,ey)
by = vpa(by);
ey = vpa(ey);
plot([-0.4, 0.4], [by ey], 'g-', 'linewidth', 2);

% draw a projected line
idl=floor(rand()*n);
plot([Ke1(1), Ke2(1)], [Ke1(2),Ke2(2)], '-ro','linewidth', 3);