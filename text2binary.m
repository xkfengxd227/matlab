function text2binary(filename, n, d, tofilename)
v = ivecs_read_txt_raw(filename, n, d);
ivecs_write(tofilename, v);
vv = ivecs_read(tofilename);
fprintf('%d, %d\n', min(min(vv-v)), max(max(vv-v)));