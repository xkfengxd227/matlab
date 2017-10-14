%% greedy nng construct

% config
dspath = '/home/ftp_1038/dataset/nus_wide/';
dsname = 'color';

% dataset
addpath ..;
v=fvecs_read([dspath, dsname, '_base.fvecs']);
n=size(v, 2);
d=size(v, 1);

%% constructing
% prepare a distance table
dist = odis_queries_dataset(v,v);

% each points as start point, select neighbors
for s=1:n
    % count the number of data points nearer to [s] or nearer to other points
    diff=repmat(dist(:,s), 1, n)-dist;      % distance to [s] - distance to every other point
    diff(diff >= 0) = 1;                        % nearer to other point, set to be 1
    diff(diff < 0) = 0;                         % nearer to [s], set to be 0
    belong = sum(diff);                    % sum to be the count of pointers nearer to other point
    
    % pick up the point that has the most neighbors against [s]
    e = belong(belong == max(belongs));
    e = e(1);                                       % if duplicate, select the first 
