function [nn, idx] = oknn_queries_dataset_unit_cosine(v, q, k)
% oknn retrieval for each query (cosine distance on unit vectors)

[d, n] = size(v);
[d, nq] = size(q);

nn = zeros(k, nq);
idx = zeros(k, nq);
for i=1:nq
    if mod(i, 100) == 0
        i
    end
    [nn(:,i), idx(:,i)] = oknn_query_dataset_unit_cosine(v, q(:,i), k);
end