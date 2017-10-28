%% depict the comparison of recall of different orders
line2 = ['-.ko'; '-.rs'; '-.gd'; '-.m^'; '-.cs'; '-.ks'];
line1 = ['-ko'; '-rs'; '-gd'; '-m^'; '-cs'; '-ks'];
lineWidth = 1.0;
markerSize = 8;
position = [50 50 650 500];
set(gcf,'Position', position);  
fontsize_legend = 14;
fontsize_title = 14;
label_size=16;
tick_size=12;


addpath ../common;

%% data
r = [97.29	93.95	88.184	76.321	51.747	27.329	13.827;...
66.751	31.632	5.4	0.693	0.089	0.009	0.001;...
2.994	0.04	0.001	0	0	0	0;...
0.022	0.002	0	0.001	0.001	0	0;...
0.002	0	0	0	0	0	0];

z = [98.271	97.587	97.467	94.635	94.07	91.04	88.522;...
76.24	64.98	55.554	50.688	50.279	50.09	49.53;...
46.348	46.711	37.823	24.518	20.262	22.496	23.399;...
32.1	22.949	20.219	19.851	12.967	11.12	11.506;...
16.394	17.168	13.205	8.385	9.884	4.131	5.094];

g = [98.021	97.339	96.547	93.747	92.886	90.443	86.087;...
77.26	64.729	55.832	50.075	49.991	50.051	49.959;...
47.52	46.817	41.068	32.312	25.391	25.621	24.346;...
35.517	27.538	23.407	22.602	14.839	13.03	11.891;...
24.272	22.243	16.8	12.059	11.303	7.031	6.177];

%% config
w=1024./(2.^[2:8]);
width=w;
d=[2,4:4:16];
nd = numel(d);
nw = numel(w);

%% display - rowwise, g-order
% parr(1,nd)=ObjectArray;
close all;
for di=1:nd
    semilogx(...
        w, g(di,:), line1(di,:),...     % gorder
        w, r(di,:), line2(di,:),...     % rowwise
        'LineWidth',lineWidth, 'MarkerSize',markerSize);       % gorder
    hold on;
end

% legend
%{
for di = 1:nd
    p = parr(di);
    if di == 1
        legend(p(1:2), ['rowwise, D2', num2str(d(di))], ['g-order, D2', num2str(d(di))]);
    else
        ah=axes('position',get(gca,'position'),'visible','off');
        legend(ah,p(1:2),['rowwise, D2', num2str(d(di))], ['g-order, D2', num2str(d(di))]);
    end
end
%}

h = legend(...
    '$d=2$, g-order',' $d=2$, rowwise',...
    '$d=4$, g-order',' $d=4$, rowwise',...
    '$d=8$, g-order',' $d=8$, rowwise',...
    '$d=12$, g-order',' $d=12$, rowwise',...
    '$d=16$, g-order',' $d=16$, rowwise');
set(h, 'interpreter', 'latex', 'location', 'northwest','fontsize', fontsize_legend);

% render
title('g-order v.s. rowwise', 'Fontname', 'Helvetica', 'FontSize', fontsize_title, 'FontWeight', 'Normal', 'Interpreter', 'none');


axis([0 256 0 100]);
xlabel('$W$', 'interpreter', 'latex');
ylabel('$recall$', 'interpreter', 'latex');

set(get(gca,'XLabel'),'FontSize',label_size, 'Vertical','top', 'Interpreter', 'latex');
set(get(gca,'YLabel'),'FontSize',label_size, 'Vertical','baseline', 'Interpreter', 'latex');
set(gcf,'Position', position);  
set(gca, 'XTick', fliplr(w));
set(gca, 'FontSize', tick_size);


%% display - z-order, g-order
% parr(1,nd)=ObjectArray;
figure;
for di=1:nd
    semilogx(...
        w, g(di,:), line1(di,:),...     % gorder
        w, z(di,:), line2(di,:),...     % zorder
        'LineWidth',lineWidth, 'MarkerSize',markerSize);       % gorder
    hold on;
end

h = legend(...
    '$d=2$, g-order',' $d=2$, z-order',...
    '$d=4$, g-order',' $d=4$, z-order',...
    '$d=8$, g-order',' $d=8$, z-order',...
    '$d=12$, g-order',' $d=12$, z-order',...
    '$d=16$, g-order',' $d=16$, z-order');
set(h, 'interpreter', 'latex', 'location', 'northwest','fontsize', fontsize_legend);

%% render
title('g-order v.s. z-order', 'Fontname', 'Helvetica', 'FontSize', fontsize_title, 'FontWeight', 'Normal', 'Interpreter', 'none');

axis([0 256 0 100]);
xlabel('$W$', 'interpreter', 'latex');
ylabel('$recall$', 'interpreter', 'latex');

set(get(gca,'XLabel'),'FontSize',label_size, 'Vertical','top', 'Interpreter', 'latex');
set(get(gca,'YLabel'),'FontSize',label_size, 'Vertical','baseline', 'Interpreter', 'latex');
set(gcf,'Position', position);  
set(gca, 'XTick', fliplr(w));
set(gca, 'FontSize', tick_size);