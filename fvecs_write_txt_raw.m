%% 将矩阵存入文本文件，“无前缀”，每行一个向量
function fvecs_write_txt_raw(filename, v)
% 参数
n = size(v, 2);
d = size(v, 1);
fid = fopen(filename, 'wt');

format_str = '%f';
for i=1:d-1
    format_str = [format_str, ' %f'];
end
format_str = [format_str, '\n'];

fprintf(fid, format_str, v);
fclose(fid);
