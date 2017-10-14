%% figure out the [s] order <mu, std> value
function us = mustd_order(v, s)
% config
[d,n] = size(v);

% width of each subspace
w = ceil(d/s);

front=1:w:d;            % clever
tail=len:len:d;         % 

% 分区块计算郡主和标准差
us=[];
for i=1:s
    sub = v(front(i):tail(i), :);
    us = [us; mean(sub); std(sub, 1)];
end