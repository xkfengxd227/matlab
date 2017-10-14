%% 将矩阵存入文本文件，“有前缀”，每行一个序号，一个向量
function ivecs_write_txt(filename, v)
% 参数
n = size(v, 2);
d = size(v, 1);
fid = fopen(filename, 'wt');

% 组装矩阵前缀
id = [1:n];
v = [id;v];
format_str = '%d';
for i=1:d
    format_str = [format_str, ' %d'];
end
format_str = [format_str, '\n'];

fprintf(fid, format_str, v);
fclose(fid);