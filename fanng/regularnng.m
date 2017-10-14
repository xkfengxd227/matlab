%% construct a nng for all points in pts, each point maintains ng edges
function E = regularnng( pts, ng )

% config
[d, n] = size(pts);

% prepare a distance table
tbl = zeros(n, n);
for i=1:n
    for j=i:n
        tbl(i,j) = pdist([pts(:,i),pts(:,j)]', 'euclidean');
        tbl(j,i) = tbl(i,j);
    end
end

% begin to construct
E = [];

for i=1:n
    % select ng nearest neighbors
    [~,I] = sort(tbl(:, i));
    E = [E, [ones(1, ng)*i; I(2:ng+1)']];
end

