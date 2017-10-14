%% z value
function z = calculate_z(n,delta)
beta=100/n;
z=sqrt((log(2/beta)/log(exp(1))) / (log(1/delta)/log(exp(1))));