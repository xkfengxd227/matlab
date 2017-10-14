%% #parallel# sequence search for [k]nns from [dataset] for points in [query]
function [nn, idx] = oknn_query_dataset_parallel(dataset, query, k)
% basic parameters
n=size(dataset,2);
d=size(dataset,1);
if d ~= size(query,1)
    fprintf('dimension dismatch\n');
    return;
end
qn=size(query,2);
if k > n
    fprintf('n is smaller than k\n');
    k = n;
end

% parallel search for [k]nns
nn=[];
idx=[];
tic;
dis = zeros(qn, n);
parfor i=1:qn
    i
	dis(i,:) = odis_query_dataset(dataset, query(:,i));
end
toc;

[N,I] = sort(dis');
nn = N(1:k, :);
idx = I(1:k, :);