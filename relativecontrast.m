%% relative contrast

addpath ..

nsample = floor(n / 100);
[d,nq] = size(q);

Dmean=zeros(1,nq);
for i=1:nq
    nslt=randselect(n, nsample);
    vs=v(:, nslt);
    
    dis = odis_query_dataset(vs, q(:, i));
    Dmean(i) = mean(dis);
end

% decipt
