%% calculate the real sort distance of a given knn set
% v - dataset, q - query set, knn - the knn idx set
function nnx = realdistance(v, q, idx)
nk = size(idx, 1);
nq = size(q, 2);
d = size(v, 1);
n = size(v, 2);

nnx = [];
for i = 1:nq
    % for the i-th query
    nn = v(:, idx(:,i)');                                               % extract the nn points
    dis = odis_query_dataset(nn, q(:,i));            % calculate distances to knn
    dis = sort(dis);
    nnx = [nnx,dis'];
end