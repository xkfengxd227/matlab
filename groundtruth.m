%% calculate the groundtruthes(k-nn) for all queries from base
function groundtruth(basefile, queryfile, gtfile, k)
% get base and query and paramaters
v = fvecs_read(basefile);
q = fvecs_read(queryfile);

if size(v, 1) ~= size(q, 1)
	fprintf('dimension not matched\n');
	exit(-1);
end

[nn, idx]=oknn_query_dataset(v, q, k);
