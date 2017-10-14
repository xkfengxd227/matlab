% Write a set of vectors and store in the fvec format (int + n * float)
% The function recieves a set of vectors (one vector per column)
%
% Syntax: 
%   v = fvecs_write (filename, A)     -> store all vectors

function fvecs_write_raw(filename, A)

fid = fopen(filename, 'wb');
fwrite(fid, A, 'single');
fclose(fid);