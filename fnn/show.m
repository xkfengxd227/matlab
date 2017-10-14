%% random select several samples to show

% seed
nselt = 10;
seed = randperm(n);
seltn = seed(1:nselt);

% plot
x = 2.^[0:5];
for i=1:nselt
    plot(x, usdis(:,i), '-o');
    figure;
end