%% extract the lower and upper bound of each dimension of a data set, divide into several intervals and get position
function [pos, bound]=position(dataset,nb)
% some path for data set
if strcmp(dataset, 'color')
    folder='../../ANN_CoorHistogram';
    datafile=[folder, '/CoorHistogram_base.fvecs'];
    posfile=[folder, '/nb_', num2str(nb), '_CoorHistogram_pos.ivecs'];
    boundfile=[folder, '/nb_', num2str(nb), '_CoorHistogram_bound.fvecs'];
elseif strcmp(dataset, 'aerial')
    folder='../../ANN_aerial';
    datafile=[folder, '/aerial_base.fvecs'];
    posfile=[folder, '/nb_', num2str(nb), '_aerial_pos.ivecs'];
    boundfile=[folder, '/nb_', num2str(nb), '_aerial_bound.fvecs'];
elseif strcmp(dataset, 'sift1M')
    folder='../../ANN_SIFT1M';
    datafile=[folder, '/sift_base.fvecs'];
    posfile=[folder, '/nb_', num2str(nb), '_sift_pos.ivecs'];
    boundfile=[folder, '/nb_', num2str(nb), '_sift_bound.fvecs'];
elseif strcmp(dataset, 'audio')
    folder='../../ANN_audio';
    datafile=[folder, '/audio_base.fvecs'];
    posfile=[folder, '/nb_', num2str(nb), '_audio_pos.ivecs'];
    boundfile=[folder, '/nb_', num2str(nb), '_audio_bound.fvecs'];
end
% basic operation of matric and file
addpath('..');
% get data set
v=fvecs_read(datafile);
d=size(v,1);
n=size(v,2);
% statistic upper and lower bounds
low=min(v);
up=max(v);
bound=[low; up];
scale=max(up-low);                                              % the maximum scale of all dimension
TOPPOS=2^nb-1;
inter=scale/(2^nb);                                                 % interval length
% calculate position for each element of each dimension
pos=floor((v-repmat(low, d, 1))/inter);                 % initial position
pos=int32(pos);
overflow=find(pos>TOPPOS);                              % deal with overflow case which floor() cannot handle
pos(overflow)=TOPPOS;
% store bounds and positions into file
ivecs_write(posfile, pos);
fvecs_write(boundfile, bound);