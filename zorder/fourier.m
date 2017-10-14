x=[0:0.05:4*pi];

hold on;
plot(x, sin(x), 'k.');
plot(x, sin(2*x), 'ko');
plot(x, sin(4*x), 'k^');
plot(x, sin(x)+0.3*sin(2*x)+0.3*sin(4*x), '-r*');