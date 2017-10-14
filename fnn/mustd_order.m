%% figure out the [s] order <mu, std> value
function us = mustd_order(v, s)
% config
[d,n] = size(v);

% width of each subspace
w = ceil(d/s);

front=1:w:d;            % clever
tail=w:w:d;         % 

% mu,std of each subspace
us=[];
for i=1:s
    sub = v(front(i):tail(i), :);
    us = [us; mean(sub); std(sub, 1)];
end