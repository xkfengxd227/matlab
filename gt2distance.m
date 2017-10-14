function gtdis=gt2distance(v, q, gt)
nq=size(q,2);

gtdis=[];
for i=1:nq
    nnv=v(:,gt(:,i));
    qi=q(:,i);
    gtdis=[gtdis, odis_query_dataset(nnv, qi)'];
    i
end