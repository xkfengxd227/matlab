%% statistic the ratio that a point locates into the same cluster with its ith-nn
dsname='aerial';
bf=100;
h=1;

k=[1,10:10:100,200:100:999];
nk=size(k,2);
n=size(assign,2);

ratio=zeros(1,nk);
clu_knn=zeros(1,n);
for i=1:nk
    clu_knn=assign(nng(1+k(i),:));
    diff=clu_knn-assign;
    ratio(i)=size(find(diff==0), 2) / n;
end

plot(k, ratio, '--b*');
title([dsname, ' -bf ', num2str(bf), ' -h ', num2str(h)]);
xlabel('k');
ylabel('match ratio');
    