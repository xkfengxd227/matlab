%% generate nng

n = size(wt.nv, 2);
d = size(wt.nv, 1);
ng = 1000;

nngnn = zeros(ng, n);
nngidx = zeros(ng, n);

for i=1:27
    from = (i-1)*10000 + 1;
    eend = i * 10000;
    if eend > n
        eend = n;
    end
    
    [nngnn(:, from:eend), nngidx(:,from:eend)]=oknn_query_dataset_parallel(wt.nv, wt.nv(:, from:eend), 1000);
end
