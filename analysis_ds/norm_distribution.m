%% norm distribute of a dataset

addpath ..
addpath ../common;

% data
dsname='mnist';
loaddataset;

% config
nslt = 10000;

% process
slt=randselect(n, nslt);
vslt=v(:,slt);

len=zeros(1,nslt);
for i=1:nslt
    len(i)=norm(vslt(:,i));
end

% display
subplot(2,1,1)
step=(max(len)-min(len))/200;
hist(len, [min(len):step:max(len)]);
title(dsname);
[N,I]=hist(len, [min(len):(max(len)-min(len))/100:max(len)]);
cum=cumsum(N)/sum(N);
subplot(2,1,2)
plot(cum,'-+');

figure;
plot([1:nslt], sort(len), '-o')
figure;
boxplot(len);