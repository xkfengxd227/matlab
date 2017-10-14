function dis=odis_queries_dataset(v, q);
d=size(v,1);
nq=size(q,2);
dis=[];
for i=1:nq
    dis=[dis,odis_query_dataset(v,q(:,i))'];
end