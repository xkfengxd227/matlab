% analysis a dataset


close all;

addpath ..
% prepare data
nslt = 1000;
seed = randperm(n);
slt=seed(1:nslt);
data = v(:,slt)';


% PCA
[wcoeff, score, latent, tsquared, explained]=pca(data, 'VariableWeights', 1./var(data));
figure;
pareto(explained);
cum=cumsum(explained);
endpts=min(find(cum>95))
axis([1 endpts 0 100])
set(gca, 'xtick', [1:endpts])
title([dsname, ': 1-', num2str(endpts)]);

% corr
figure;
surf(C)

% display - distribution of each dimension
figure;
boxplot(data);
title(dsname);

C=corr(data);
MC=C>0.8;
[x y]=find(MC==1);
coor=[x,y];