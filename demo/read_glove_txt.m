filename='/home/xikafe/glove.twitter.27B.200d.txt';
% filename='/home/xikafe/glove_5.txt';
fid = fopen(filename, 'rt');
v = [];
d = 200;
n = 1193514;

format_str = '%s';
for i=1:d
    format_str = [format_str, ' %f'];
end

v = textscan(fid, format_str, n);
data = cell2mat(v(1,2:end));

fclose(fid);