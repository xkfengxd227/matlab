% random experiments to compare different linear orders

%% config
recall_row=[];
for d=[2:2:10]
    dsname=['uniform', num2str(d)];
    I = 2.^[2:8];				% number of internal
    k = 100;
    addpath /media/xikafe/dataset/matlab;

    %% load dataset
    v=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_base.fvecs']);
    q=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_query.fvecs']);
    gt=ivecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_gt.ivecs']);
    gt=gt+1;

    [d,n]=size(v);
    [~,nq]=size(q);
    S = max(max(v)) - min(min(v))

    %% figure out average diff
    nI = size(I,2);
    avg_diff = zeros(1,nI);

    vq=[v,q];
    for i=1:size(I,2)
        W = S / I(i);           		% width
        K = floor(vq / W);      		% keys 
        R = I(i) / 2;                   % range
        
        % row-wise linear order
        wOrder = I(i).^([1:d]-1);		% weight of each dimension
        oall = wOrder*K;				% order of all vectors

        oknn = oall(gt(1:k,:));			% knn's order
        oq = repmat(oall(n+1:end), k,1);				% query's order

        odiff = abs(oq-oknn);
        avg_diff(i) = sum(sum(odiff<=R)) / nq;
    end

    recall_row=[recall_row;avg_diff];
end