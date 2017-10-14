function [nn, idx] = oknn_query_dataset_unit_cosine(v, q, k)
% retireval k-nn of q from v in [cosine distance]
% we suppose that vectors are all unit vectors

cosdis = q'*v;
[N,I]=sort(cosdis, 'descend');
nn = N(1:k);
idx = I(1:k);

