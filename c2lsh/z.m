%% z value
function v = calculateZ(n)
beta=100/n;
delta=0.01;
v=sqrt((log(2/beta)/log(exp(1))) / (log(1/delta)/log(exp(1))));