%% 读取文本格式的矩阵，矩阵按照“有前缀”方式存储，即每一行存一个编号，一个向量
function v=fvecs_read_txt(filename, n, d)
fid = fopen(filename, 'rt');
v = [];
% 组装格式
format_str = '%f';
for i=1:d
    format_str = [format_str, ' %f'];
end

% 读取数据
v = fscanf(fid, format_str, [d+1,n]);
v = v(2:d+1, :);
fclose(fid);
