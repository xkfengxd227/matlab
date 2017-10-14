% load common data of a dataset: base, query, groundtruth,
% groundtruth-distance

dspath = ['/media/xikafe/dataset/', dsname, '/bin/', dsname, '_'];
v = fvecs_read([dspath, 'base.fvecs']);
q = fvecs_read([dspath, 'query.fvecs']);
gt = ivecs_read([dspath, 'gt.ivecs']);
gt = gt + 1;
gtdis = fvecs_read([dspath, 'gtdis.fvecs']);

[d,n]=size(v);
[d,nq]=size(q);