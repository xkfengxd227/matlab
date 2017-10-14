%% the batch operations for loading data: need to specify the [dsname]

% config
addpath ..;
dspath = '/media/xikafe/dataset/';

% load data
ds_prefix = [dspath, dsname, '/bin/', dsname];
v = fvecs_read([ds_prefix, '_base.fvecs']);
q = fvecs_read([ds_prefix, '_query.fvecs']);
gt = ivecs_read([ds_prefix, '_gt.ivecs']);
gt = gt + 1;    % index begins from 1 in matlab
gt = int32(gt);
gtdis = fvecs_read([ds_prefix, '_gtdis.fvecs']);

U = max(max([v,q])) - min(min([v,q]));
[d, n] = size(v);
[d, nq] = size(q);
