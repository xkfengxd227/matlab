% random experiments to evaluate average distance(or diff) of NNs along g-order

%% config
recall_gorder = [];
for d = [2:2:10]
    dsname=['uniform', num2str(d)];         % dataset name
    I = 2.^[2:8];                           % number of internal
    k = 100;
    addpath /media/xikafe/dataset/matlab;	% add common tools

    %% load dataset
    v=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_base.fvecs']);
    q=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_query.fvecs']);
    gt=ivecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_gt.ivecs']);
    gt=gt+1;

    [d,n]=size(v);
    [~,nq]=size(q);
    S = max(max(v)) - min(min(v))				% check out scale of the dataset

    %% figure out average diff
    nI = size(I,2);
    avg_diff = zeros(1,nI);

    vq=[v,q];
    for i=1:size(I,2)
        W = S / I(i);           % width
        svq = uint32(vq / W);	% coordinates in widths

        % figure out the g-order of all vectors
        oall = gorder_encode(svq);	% all orders: [d,n+nq]
        
        oq = oall(:, n+1:end);  % order of all queries: [d,nq]
        R = I(i) / 2;              % range
        cnt = 0;
        for ki = 1:k
            % for each k-nn search
            okinn = oall(:, gt(ki, :));               % order of all ki-th nn: [d, nq]
            odiff = abs(okinn-oq);
            
            if d == 2
                cnt = cnt + sum(odiff(2,:) <= R);                % ���С��R
            else
                valid = (sum(odiff(1:d-1,:)) == 0);     % ǰd-1��֮��Ϊ0
                cnt = cnt + sum(odiff(d,valid)<=R);         % ��d�в��С��R
            end
        end

        avg_diff(i) = cnt / nq;
    end

    recall_gorder=[recall_gorder;avg_diff];
end;