%% odistance of n vectors to n vectors, one by one
function dis_n = odistance_n_n(vn, vvn)
n = size(vn, 2);
dis_n = [];

for i = 1:n
    dis_n = [dis_n; odistance_1_1(vn(:,i), vvn(:,i))];
end
