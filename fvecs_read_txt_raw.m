%% 读取文本格式的矩阵，矩阵按照“无前缀”方式存储，即每�?��存一个向�?
function v=fvecs_read_txt_raw(filename, n, d)
fid = fopen(filename, 'r');
v = [];
% 组装格式
format_str = '%f';
for i=1:d-1
    format_str = [format_str, ' %f'];
end

% 读取数据
v = fscanf(fid, format_str, [d,n]);
fclose(fid);