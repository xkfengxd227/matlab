%% split a dataset into two sets: one is query set including n_q queries, another are data set
% return the query set, their ids and the leftover dataset
function [q, id_q, v, id_v] = extract_query_from_dataset(dataset, n_q)
addpath(['common']);
total = size(dataset, 2);
id_all = [1:total];
id_q = uniform_step_id_list(total, n_q);
id_v = setdiff(id_all, id_q);
q = dataset(:, id_q);
v = dataset(:, id_v);
