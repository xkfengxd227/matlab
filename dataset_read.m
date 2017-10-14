% Read a set of vectors stored in the text format: 
%   line 1: n d
%   line others: id vector
% The function returns a set of ids and a set of vectors(one vector per column)
%
% Syntax: 
%   v = fvecs_read (filename)

function [idx, v] = dataset_read(filename)
fid = fopen(filename, 'r');

temp = fscanf(fid, '%d %d', [1,2]);
n = temp(1);
d = temp(2);

formatstr='%d';
for i = 1:d
    formatstr=[formatstr, ' %f'];
end

data = fscanf(fid, formatstr, [d+1, n]);
idx=data(1, :);
v = data(2:d+1, :);
fclose(fid);
