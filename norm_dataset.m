%% norm dataset to [lb, ub]
function nv = norm_dataset(v,lb,ub)

minv = min(min(v));
maxv = max(max(v));

range = ub-lb;
ulen = (maxv - minv) / range;

nv = floor((v - minv) / ulen)+lb;
