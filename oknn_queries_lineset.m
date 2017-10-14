function [ nn, idx ] = oknn_queries_lineset(lineb, linee, qs, k)
% calculate knn for a query from a line set
%   @param      lineb       begin point of a line
%   @param      linee       end point of a line
%   @param      query       the query point
%   @param      k               number of nns to return

[~, nq] = size(qs);

nn = ones(k, nq) * -1;
idx = ones(k, nq) * -1;

for i=1:nq
    pldis = odis_point_lines(lineb, linee, qs(:,i));
    [X,I] = sort(pldis);
    
    nn(:,i) = X(1:k)';
    idx(:,i) = I(1:k)';
    
    i
end