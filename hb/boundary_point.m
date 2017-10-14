%% use the [boundary points of a cluster] to form the lower bound

% load member assign
asgfile=['/home/xikafe/libxkfeng/hb/index/', dsname, '/K=600/assign.txt'];
assign=fvecs_read_txt_raw(asgfile, n,1);

% extract the members of the cid-th cluster
cid = 0;
vpos=find(assign==cid);
qpos=find(assign~=cid);

% extract the vectors of base and query
vc = v(:, vpos);
qc = v(:, qpos);

% 1-nn search
[nn, idx]=oknn_query_dataset(vc, qc, 1);


