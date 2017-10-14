%%  test for c2lsh + nng
%   use c2lsh to locate on a batch of candidates
%   use nng to converge to nns
%   check the recall/precision of nn search

close all;

%%
addpath ../common; addpath ..;

%% nn search parameters
ncand=200;             % number of candidates
k=100;                  % k
nq=200;                	% number of query points
ng=100;                  % number of neighbors to consider

%% load relative data
% loaddata;

%% lsh parameters: m,w,b,a
lsh.m=32;              %%% lsh number
lsh.w=0.1;              %%% interval length
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
cand_knn = zeros(k, nq);
cand_knndis = zeros(k, nq);
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
    [Y,I] = sort(counter, 'descend');
    candids = I(1:ncand);

    % record the knn-search results of 1-round-count
    candpts = v(:,candids);
    [nn,idx] = oknn_query_dataset(candpts, query, k);
    cand_knn(:,qi) = candids(idx(1:k));         % !!! the top k positions to point ids
    cand_knndis(:,qi) = nn(1:k);
end

toc;

%% accuracy
disp('report candidate quality');
[ratio, recall, precision, details] = knn_accuracy(gt(1:k, 1:nq), gtdis(1:k, 1:nq), cand_knn, cand_knndis);
str = sprintf('--- %s: m=%d, w=%f, nc=%d, nq=%d, k=%d ---\nratio=%f, recall=%f, precision=%f', ...
    dsname, lsh.m, lsh.w, ncand, nq, k, ratio, recall, precision);
disp(str);
