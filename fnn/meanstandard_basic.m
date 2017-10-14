%% 基础方法：对一个数据集统计每一个数据点的平均值和方差
function us = meanstandard_basic(v)
% 获取参数
n=size(v, 2);
d=size(v,1);

u=mean(v);
s=sqrt(var(v)*(d-1)/d);
us=[u;s];