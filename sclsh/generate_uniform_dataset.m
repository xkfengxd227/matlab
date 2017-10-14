% generate dataset

%% config
d = 2;
n = 100000;
nq = 1000;
nGT = 1000;         % dim-groundtruth
S = 1000;           % scale

%% generate
v = rand(d,n)*S;
q = rand(d,nq)*S;

[nn,idx]=oknn_query_dataset(v,q,nGT);
idx = idx-1;

%% save dataset
dsname=['uniform', num2str(d)];
mkdir(['/media/xikafe/dataset/',dsname]);
mkdir(['/media/xikafe/dataset/',dsname,'/bin']);
fvecs_write(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_base.fvecs'],v);
fvecs_write(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_query.fvecs'],q);
ivecs_write(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_gt.ivecs'],idx);
fvecs_write(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_gtdis.fvecs'],nn);
