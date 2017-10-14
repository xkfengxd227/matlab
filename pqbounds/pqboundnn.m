%% perform exact nn search based on PQ bounds, indexed by 1-D projection
% For quick, we will not strictly deal with details in real NN search, such
% as [distance between query and a PQ code], [not care about query locates
% at end point]

addpath /media/research/dataset/matlab/ckmeans/ckmeans/results;
addpath /media/research/dataset/matlab
global baseR;
global queryR;
global cbase;
global model;
v = model.R'*base;
q = queryR;
center = cell2mat(model.centers');
n = size(v, 2);
d = size(v, 1);
B = 32;


%% for projection prepare
a = ones(d, 1);
a = a / norm(a);                                                                    % a unit vector

% projection
projv = v'*a;
[Y,I]=sort(projv);
sv = v(:,I);
svcode = vcode(:,I);
sdiff = diff(I);

nn = [];
cand = [];
%% NN search
disqc=odistance_queries_dataset(svcode, queryR);
lb = disqc-sdiff;
ub = disqc+sdiff;

        