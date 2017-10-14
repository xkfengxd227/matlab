%% generate n ids uniformly step distributed in [1, max]
function id_list = uniform_step_id_list(max, n)
step = floor(max / n);
id_list = [1:n]*step;
