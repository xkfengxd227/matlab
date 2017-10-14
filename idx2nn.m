%% calculate nn distance by idx
% need: idx, v, q
function nn = idx2nn(v, q, idx)
nq = size(q, 2);
d = size(q, 1);
nv = size(v, 2);
nk = size(idx, 1);

nn = [];
for i = 1:nq
    nnvi = v(:, idx(:,i)');
    dis = odis_query_dataset(nnvi, q(:,i));
    nn = [nn, dis'];
end