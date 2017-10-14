function generatequery1000(filename)
data_file = ['/home/xkfeng/dataset/',filename,'/',filename,'D.txt'];
query_file = ['/home/xkfeng/dataset/',filename,'/',filename,'Q.txt'];

[idx, v] = dataset_read(data_file);
[idx, q] = dataset_read(query_file);

allv = [v,q];                           % combine data set and query set

n = size(allv, 2);
step = floor(n / 1000);

idallv = [1:n];
idq = [1:1000]*step;
idv = setdiff(idallv, idq);

v = allv(:,idv);
q = allv(:,idq);

metrixtofile(v, [filename,'D.txt'], 'single');
metrixtofile(q, [filename,'Q.txt'], 'single');
fvecs_write([filename,'_base.fvecs'], v);
fvecs_write([filename,'_query.fvecs'], q);
