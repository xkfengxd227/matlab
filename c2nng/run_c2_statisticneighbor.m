%%  test for c2lsh + nng
%   use c2lsh to sort points according to collision counts
%   use nng to statistic nn candidates with much neighbors
%   check the recall/precision of nn search

close all;

%%
addpath ../common; addpath ..;

%% nn search parameters
ncand=100;             % number of candidates
k=100;                  % k
nq=200;                	% number of query points
g=50;                  % number of neighbors to consider

%% load relative data
% loaddata;

%% lsh parameters: m,w,b,a
lsh.m=100;              %%% lsh number
lsh.w=0.08;              %%% interval length
% rand('seed',1);         % random starts from the same
lsh.b=rand()*lsh.w;     % b~u(0,w)
% lsh.b = lsh.b + sqrt(d) * U;
lsh.b = lsh.b + U;
                        % shift all hash values to positive
lsh.a=[];               % random projection vectors
% randn('seed',1);
rawa=randn(d,lsh.m);
lsh.a=norm_vectors(rawa);

%% LSH encoding
lsh.x=uint32(floor((lsh.a'*v+lsh.b)/lsh.w));
lsh.qx=uint32(floor((lsh.a'*q+lsh.b)/lsh.w));

%% for each query, search for k-nns
c2_knn = zeros(k, nq);
c2_knndis = zeros(k, nq);
c2nng_knn = zeros(k, nq);
c2nng_knndis = zeros(k, nq);
tic;
for qi=1:nq
    if d >= 100
       qi
    end

    %% 1-round-collision
    qx=lsh.qx(:,qi);            % extract the query code
    query=q(:,qi);

    % collisiding
    diff=repmat(qx,1,n)-lsh.x;  % [m,n]
    counter=sum(diff==0);       % [1,n] collision time = number of zeros

    % sort and extract top-ncand points
    [X_count,id_count] = sort(counter, 'descend');
    candids = id_count(1:ncand);

    % statistic votes of all neighbors
    votes = zeros(1, n);
    for ci = 1:ncand
        ineighbors = G(1:g, candids(ci));
        votes(ineighbors) = votes(ineighbors) + 1;
    end
    [X_votes,I_votes] = sort(votes, 'descend');
    
    % collect knn result
    iknn = I_votes(1:k);
    [X_iknn,I_iknn] = sort(odis_query_dataset(v(:,iknn), q(:,qi)));
    cand_knn(:,qi) = iknn(I_iknn);
    cand_knndis(:,qi) = X_iknn;
end

toc;

%% accuracy
disp('report candidate quality');
[ratio, recall, precision, details] = knn_accuracy(gt(1:k, 1:nq), gtdis(1:k, 1:nq), cand_knn, cand_knndis);
str = sprintf('--- %s: m=%d, w=%f, nc=%d, nq=%d, k=%d ---\nratio=%f, recall=%f, precision=%f', ...
    dsname, lsh.m, lsh.w, ncand, nq, k, ratio, recall, precision);
disp(str);
