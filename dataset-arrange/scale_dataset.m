%% scale baseset, and queryset of [dsname] to [0, U]
function scale_dataset(dsname, U)
% config
addpath ..;

% load data
v = fvecs_read(['/media/xikafe/dataset/', dsname, '/bin/', dsname, '_base.fvecs']);
q = fvecs_read(['/media/xikafe/dataset/', dsname, '/bin/', dsname, '_query.fvecs']);
cntq = size(q, 2);

% scale
qv = [q, v];
nqv = norm_dataset(qv, 0, U);

% split
nq = nqv(:, 1:cntq);
nv = nqv(:, cntq+1:end);

% save
fvecs_write(['/media/xikafe/dataset/', dsname, '/bin/', dsname, '_normbase.fvecs'], nv);
fvecs_write(['/media/xikafe/dataset/', dsname, '/bin/', dsname, '_normquery.fvecs'], nq);