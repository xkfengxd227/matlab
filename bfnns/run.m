% brute-force nn search

% config
k = 100;
nq = 100;

% begin to search
tic;
knn = zeros(k, nq);
knndis = zeros(k, nq);
for qi=1:nq
    % [nn, idx] = oknn_query_dataset(v, q(:,qi), k);
    dis = zeros(1,n);
    for ni=1:n
        dis(ni) = odis2(v(:,ni), q(:,qi));
    end
    [nn, idx] = sort(dis);
    knn(:,qi) = idx(1:k);
    knndis(:,qi) = nn(1:k);
end
toc;

[ratio, recall, precision] = knn_accuracy(gt, gtdis, knn, knndis);
disp('ratio, recall@1, precision');
disp([num2str(ratio), ', ', num2str(recall), ', ', num2str(precision)]);