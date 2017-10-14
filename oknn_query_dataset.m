%% #normal mode# sequence search for [k]nns from [dataset] for points in [query]
function [nn, idx] = oknn_query_dataset(dataset, query, k)
nn=[];
idx=[];
% dataset parameters
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

% search for [k]nns
dis = zeros(qn,n);
for i=1:qn
    if mod(i, 100) == 0
        i
    end
    dis(i,:) = odis_query_dataset(dataset, query(:,i));
end

[N,I] = sort(dis');
nn = N(1:k, :);
idx = I(1:k, :);