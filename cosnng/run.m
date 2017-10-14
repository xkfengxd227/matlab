% a general process for cos nn search based on cosnng
% cos nn: points that share the maximum cosine value with q

% import
addpath ..;
addpath ../common;

%% config
dsload = true;                                  % whether you have loaded the data
g = 50;                                                 % how many neighbors to extract each time
k = 100;                                            % how many nn to retrieval for each query
nq = 100;
Np = 2000;                                      % how many points to check
log_on = true;
DOUBLE_MAX = 99999.99;
if log_on
    disp(['--- cos NNG running on ', dsname, 'dataset ---']);
    disp(['g = ', num2str(g), ', k=', num2str(k), ', Np=', num2str(Np)]);
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


%% cos nn search
tic;
knn = int32(ones(k, nq) * (n+1));
knndis = ones(k, nq) * -1.;
traversed.point = zeros(1,nq);
traversed.neighbor = zeros(1,nq);
for iq=1:nq
    if log_on && mod(iq, 50) == 0
        disp(num2str(iq));
    end
    
    query = q(:, iq);

	% some accessing status: a disk page, a point, a point's neighbor
        status.neighbor = zeros(1, n);                  % neighbor has been expanded
    status.point = zeros(1, n);                         % point whether has been verified
    
    % init candidate set and loaded points counter
    candHeap = [];
    knnPriors = [];               % hold all priors that has been removed from the candidate set
    cnt = 0;

    % init the heap with a random start
    istart = randi(n);
    candHeap = [candHeap, [istart; query'*v(:,istart)]];
    cnt = cnt +1;
    
    % begin the iteration on the candHeap with nng
    while ~isempty(candHeap) && cnt < Np            % end loop condition: 
        candHeap = -sortrows(-candHeap', 2)';           % turn the distance into negative before sort
        
        prior = candHeap(:,1);
        priorId = candHeap(1,1);
        
        % remove all points that has been expanded, move them to knnPriors
        candHeap = candHeap(:, ~(candHeap(1,:)==priorId));
        knnPriors = [knnPriors, priorId];

        % extract all neighbor of the current prior
        if 0 == status.neighbor(priorId)
            % load all its neighbors
            ids = G(2:g+1,priorId);                         % the first neighbor is itself
            ids = ids(status.point(ids) == 0);      % filter out all points that has been traversed
            pts = v(:,ids);
            
            if numel(ids) > 0
                % figure out the distance and insert all the [id, dis] pairs
                % into candHeap
                cosdis = query'*pts;                            % lack of repeated points
                candHeap = [candHeap, [single(ids'); cosdis]];
                status.point(ids) = 1;
                status.neighbor(priorId) = 1;
                cnt = cnt + numel(ids);
            end
        end
    end % end of while
    
    % collect all knn candidates from candHeap and knnPriors
    knnCand = unique([knnPriors, candHeap(1,:)]);
    [nn, idx] = oknn_query_dataset_unit_cosine(v(:,knnCand), query, k);
    knndis(:,iq) = nn;
    knn(:,iq) = knnCand(idx);
    traversed.point(iq) = sum(status.point == 1);
    traversed.neighbor(iq) = sum(status.neighbor == 1);
end
run_time = toc;

% report
[ratio, recall, precision] = knn_accuracy(gt, gtdis, knn,knndis);
avg_points = mean(traversed.point);
avg_neighbors = mean(traversed.neighbor);
if log_on
    disp('ratio, recall@1, precision, time, points, points-expanded-neighbor');
end
disp([num2str(ratio), ', ', num2str(recall), ', ', num2str(precision), ', ', num2str(run_time*1000/nq), ', ', num2str(avg_points), ', ', num2str(avg_neighbors)]);
