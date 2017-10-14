%% figure the accuracy of knn-search set versus knn-set
%   @param      gt          groundtruth-ids         [k x nq]
%   @param      gtdis       groundtruth-distance    [n x nq]
%   @param      knn         knn-search-ids          [k x nq]
%   @param      knndis      knn-search-dis          [k x nq]
function [ratio, recall, precision, details]=knn_accuracy(gt, gtdis, knn, knndis)
% config
[k, nq] = size(knn);
gt = gt(1:k, 1:nq);
gtdis = gtdis(1:k,1:nq);

% ratio
zero_cnt = 0;
sum_ratio = 0;
for i=1:nq
    for j=1:k
        if gtdis(j,i) == 0
            zero_cnt = zero_cnt + 1;
        else
            sum_ratio = sum_ratio + knndis(j,i) / gtdis(j,i);
        end
    end
end
ratio = sum_ratio / (nq * k - zero_cnt);

% ratio = mean(mean(knndis ./ gtdis));

% recall-1: whether the real 1-nn exists in the knn-set
recall_status = zeros(1,nq);
for i=1:nq
    recall_status(i) = ~isempty(intersect(gt(1,i), knn(:,i)));
                                % whether the real 1-nn exists in knn-set
end
recall = mean(recall_status);

% precision
pre_status = zeros(1,nq);
for i=1:nq
    inter = intersect(gt(:,i), knn(:, i));
    if ~isempty(inter)
        pre_status(i) = size(inter, 1);
    end
end
precision = mean(pre_status) / k;

if k > 1
    details = [mean(knndis./gtdis); recall_status; pre_status]';
else
    details = [knndis./gtdis; recall_status; pre_status]';
end