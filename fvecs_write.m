% Write a set of vectors and store in the fvec format (int + n * float)
% The function recieves a set of vectors (one vector per column)
%
% Syntax: 
%   v = fvecs_write (filename, A)     -> store all vectors

function fvecs_write(filename, A)
n = size(A, 2);
d = size(A, 1);

fid = fopen(filename, 'wb');
for i=1:n
    fwrite(fid, d, 'int');
    fwrite(fid, A(:,i), 'single');
end

fclose(fid);