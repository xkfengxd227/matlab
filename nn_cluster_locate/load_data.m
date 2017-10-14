%% the batch operations for loading data: need to specify the [dsname]

% config
addpath ..;
dspath = '/media/xikafe/dataset/';

% warning of requirements: dsname and K
disp('make sure you have specified the [dsname] and [K]');

% load data
ds_prefix = [dspath, dsname, '/bin/', dsname];
% --- base, query, gt, gtdis
v = fvecs_read([ds_prefix, '_base.fvecs']);
q = fvecs_read([ds_prefix, '_query.fvecs']);
gt = ivecs_read([ds_prefix, '_gt.ivecs']);
gt = gt + 1;    % index begins from 1 in matlab
gt = int32(gt);
gtdis = fvecs_read([ds_prefix, '_gtdis.fvecs']);
% --- nng
G = ivecs_read([ds_prefix, '_1000nng.ivecs']);
G = G + 1;      % same as groundtruth
G = int32(G);
% --- cluster
cent=fvecs_read([ds_prefix, '_cluster', num2str(K), '.centroid.fvecs']);
assign=ivecs_read([ds_prefix, '_cluster', num2str(K), '.assign.ivecs']);
assign = int32(assign+1);
% --- basic configs
[d, n] = size(v);
[d, nq] = size(q);
