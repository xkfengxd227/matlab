%% average LSH range of a dataset

addpath ..
addpath ../common

% data
%{
dsname='gauss32';
v=fvecs_read(['/media/xikafe/dataset/', dsname, '/bin/', dsname, '_base.fvecs']);
%}
[d,n]=size(v);
m=200;

% random a
N=10;
ranges=zeros(1,N);
for i=1:N
    a = randn(d, m);
    % na = unit_vectors(a);
    % ax = na'*v;
    ax = a'*v;

    % range
    lax = min(ax');
    uax = max(ax');

    rangeax = uax-lax;
    
    ranges(i) = mean(rangeax);
end

fprintf('%s: range %f\n', dsname, mean(ranges));