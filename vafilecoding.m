%% 测试VAFile :对一个矢量编码：
function code=vafilecoding(v, bound, nbit)
n=size(v,2);
d=size(v,1);

ninter=2^nbit;
inter=(bound(:,2)-bound(:,1))/ninter;

inters=repmat(inter, 1, n);
code=floor((v-repmat(bound(:,1), 1, n)) ./ inters);
