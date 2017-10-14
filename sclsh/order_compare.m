% random experiments to compare different linear orders

%% config
dsname='uniform10';
I = [4,8,16,32,64,128,256];
addpath /media/xikafe/dataset/matlab;

%% load dataset
v=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_base.fvecs']);
q=fvecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_query.fvecs']);
gt=ivecs_read(['/media/xikafe/dataset/',dsname,'/bin/',dsname,'_gt.ivecs']);
gt=gt+1;

[d,n]=size(v);
[~,nq]=size(q);
S = max(max(v)) - min(min(v))

%% figure out average diff
nI = size(I,2);
avg_diff = zeros(1,nI);

vq=[v,q];
for i=1:size(I,2)
    W = S / I(i);           % width
    K = floor(vq / W);      % keys 
    
    % row-wise linear order
    wOrder = I(i).^([1:d]-1);
    oall = wOrder*K;
    
    onn = oall(gt(1,:));
    oq = oall(n+1:end);
    
    odiff = abs(oq-onn);
    avg_diff(i) = mean(odiff);
end

rowwise=[rowwise;avg_diff];