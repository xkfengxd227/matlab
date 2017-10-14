% scale query set together with base set
function [sq, sv] = scalequerybase(q,v,lb,ub)
[~,nq]=size(q);
qv=[q,v];
sqv=scaledataset(qv,lb,ub);
sq=sqv(:,1:nq);
sv=sqv(:,nq+1:end);