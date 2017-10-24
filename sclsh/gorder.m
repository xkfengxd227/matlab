% random experiments to evaluate average distance(or diff) of NNs along g-order

%% config
dsname='uniform10';						% dataset name
I = [4,8,16,32,64,128,256];				% number of internal
addpath /media/xikafe/dataset/matlab;	% add common tools

%% load dataset
v=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_base.fvecs']);
q=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_query.fvecs']);
gt=ivecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_gt.ivecs']);
gt=gt+1;

[d,n]=size(v);
[~,nq]=size(q);
S = max(max(v)) - min(min(v))				% check out scale of the dataset

%% figure out average diff
nI = size(I,2);
avg_diff = zeros(1,nI);

vq=[v,q];
for i=1:size(I,2)
    W = S / I(i);           % width
	svq = uint32(vq / W);	% coordinates in widths
    K = floor(vq / W);      % keys 
    
	% figure out the g-order of all vectors
	oall = gordering(svq);	% all orders
    
    
    onn = oall(gt(1,:));
    oq = oall(n+1:end);
    
    odiff = abs(oq-onn);
    avg_diff(i) = mean(odiff);
end

gorder_diff=[gorder_diff;avg_diff];