%% solve the digit recognition problem using kNN search

% load data by yourself
disp('I suppose you have load all needed data: train, tags, test');
nq = size(q,2);
n = size(v,2);
d = size(v,1);

% knn vote
rslt = ones(nq, 1) * -1;
for qi=1:nq
    qi
    nns = knn(:,qi)';
    codes = tag(nns);
    
    [cnt,center]=hist(codes, [0:9]);
    topidx = find(cnt==max(cnt));
    topidx = topidx(1);
    
    rslt(qi) = center(topidx);
end
    