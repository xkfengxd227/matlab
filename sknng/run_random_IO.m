% a general process for sknng 

% import
addpath ..;
addpath ../lsh;
addpath ../common;

%% config
dsload = true;                                  % whether you have loaded the data
% m = 10;                                         % number of lsh functions in a compound set
w = sqrt(d)*U / 1000;                                        % lsh function width
B = double(floor(1024 / d));                                         % points in a disk page
k = 100;                                         % [k]-NN
nq = 100;
NP = 1000;                                      % how many points to check
% g = 10;
algorithm_need_sort = true;    % true: sort, false: random start
log_on = false;
DOUBLE_MAX = 99999.99;
if log_on
    disp(['--- SK-NNG running on ', dsname, 'dataset ---']);
    disp(['m = ', num2str(m), ', w=', num2str(w), ', B=', num2str(B)]);
end

%% load data
if dsload
    if log_on
        disp(['we suppose that you have loaded the dataset for ', dsname]);
    end
else
    load_data;
    if log_on
        disp('data loaded successffully, the program will exit(0)');
    end
    return;
end

%% encode data and store
% generate lsh functions
lsh = generate_compound_lsh(m, w, d, U);

% encode the base dataset
ori_codev = lsh_encode(lsh, v);

% sort the code and the data in ascending order of code
if algorithm_need_sort
    if m == 1
        [codev, idx_v] = sort(ori_codev);
    else
        [codev, idx_v] = xikafe_sort_vectors_in_lex_order(ori_codev);
    end
else
    codev = ori_codev;
    idx_v = 1:n;
end
% pos_v[i] means the position in sorted list of the i-th point
pos_v = zeros(1,n);
pos_v(idx_v) = 1:n;


%% search on sorted set
% encode the query
tic;
codeq = lsh_encode(lsh, q);
knn = int32(ones(k, nq) * (n+1));
knndis = ones(k, nq) * -1.;
pageload = zeros(1,nq);
for iq=1:nq
    if log_on && mod(iq, 50) == 0
        disp(num2str(iq));
    end
    codeqi = codeq(:,iq);
    iquery = q(:,iq);

	% some accessing status: a disk page, a point, a point's neighbor
    status.page = zeros(1, floor(n / B) + 1);
    status.loadpage = zeros(1, floor(n/B)+1);
    status.neighbor = zeros(1, n);
    status.point = zeros(1, n);
    status.pointExpanded = zeros(1, n);
    
    % candHeap = [ones(1,NP+1000)*(-1); ones(1, NP+1000) * DOUBLE_MAX];                  % NP big enough to hold all loaded candidates
    % init candidate set and loaded points counter
    candHeap = [];
    knnPriors = [];               % hold all priors that has been removed from the candidate set
    cnt = 0;

    % find the disk page that the query locate on
    if algorithm_need_sort
        qpos = xikafe_locate_the_query(codev, codeqi);
    else
        qpos = randi(n);
    end
    qpage = int32(ceil(qpos / B));
    if qpage <= 0
        qpage = 1;
    end
    if qpage >= n / B
        qpage = n / B;
    end
    qpage = int32(qpage);
    
    % init the cand heap: load all points on disk [qpage], add them to candHeap
    pagebegin = B * (qpage-1) + 1;
    pageend = B * qpage;
    if pageend > n
        pageend = n;
    end
    npagepts = pageend - pagebegin + 1;
    ids = idx_v(pagebegin:pageend);
    for ipts=1:npagepts
        cnt = cnt + 1;
        pid = ids(ipts);

        candHeap = [candHeap, [double(pid); odis2(iquery, v(:,pid))]];
        status.point(pid) = 1;
    end
    
    status.page(qpage) = 1;
    status.loadpage(qpage) = 1;
    
    % begin the iteration on the candHeap with nng
    while ~isempty(candHeap) && cnt < NP
    % end loop condition: 
        candHeap = sortrows(candHeap', 2)';
        
        prior = candHeap(:,1);
        priorId = candHeap(1,1);
        
        % remove all points that has been expanded
        candHeap = candHeap(:, ~(candHeap(1,:)==priorId));
        knnPriors = [knnPriors, priorId];
        
        % convert the point id to its position
        pos = pos_v(priorId);
        priorPage = int32(ceil(pos / B));

        if 1 == status.pointExpanded(priorId)
            % deal with repeated points
            continue;
        end
        
        if 0 == status.page(priorPage)
            % load a new page
            pagebegin = B * (priorPage-1) + 1;
            pageend = B * priorPage;
            if pageend > n
                pageend = n;
            end
            npagepts = pageend - pagebegin + 1;
            ids = idx_v(pagebegin:pageend);
            pts = v(:,ids);
            for ipts = 1:npagepts
                pid = ids(ipts);
                if 1 == status.point(pid)
                    % deal with repeated points
                    continue;
                end
                cnt = cnt + 1;                
                candHeap = [candHeap, [double(pid); odis2(iquery, v(:,pid))]];
                status.point(pid) = 1;
            end
            status.page(priorPage) = 1;
            status.loadpage(priorPage) = 1;
        end
        if 0 == status.neighbor(priorId)
            % load all its neighbors
            ids = G(:,priorId);
            for ipts = 1:g
                pid = ids(ipts);
                if 1 == status.point(pid)
                    % repeated points
                    continue;
                end
                cnt = cnt + 1;
                candHeap = [candHeap, [double(pid); odis2(iquery, v(:,pid))]];
                status.point(pid) = 1;
                
                % mark the point's page
                pos = pos_v(pid);
                pPage = int32(ceil(pos / B));
                status.loadpage(pPage) = 1;
            end
            status.neighbor(priorId) = 1;
        end
    end % end of while
    
    % collect all knn candidates from candHeap and knnPriors
    knnCand = unique([knnPriors, candHeap(1,:)]);
    [nn, idx] = oknn_query_dataset(v(:,knnCand), iquery, k);
    knndis(:,iq) = nn;
    knn(:,iq) = knnCand(idx);
    pageload(iq) = sum(status.loadpage == 1);
    
    %{
    candHeap = sortrows(candHeap', 2)';
    knn(:,iq) = candHeap(1,1:k)';
    knndis(:,iq) = candHeap(2,1:k)';
    %}
end
run_time = toc;

% report
if log_on
    disp(['------ ', dsname, ' ------']);
    disp(['m = ', num2str(m), ', w = ', num2str(w), ', B = ', num2str(B), ', k = ', num2str(k), ', nq = ', num2str(nq), ', NP = ', num2str(NP), ', g = ', num2str(g)]);
end
[ratio, recall, precision] = knn_accuracy(gt, gtdis, knn,knndis);
avg_pageload = mean(pageload);
if log_on
    disp('ratio, recall@1, precision, time, pages');
end
disp([num2str(ratio), ', ', num2str(recall), ', ', num2str(precision), ', ', num2str(run_time*1000/nq), ', ', num2str(avg_pageload)]);
