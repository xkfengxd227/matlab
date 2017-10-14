% Read a set of vectors stored in the fvec format (int + n * float)
% The function returns a set of output vector (one vector per column)
function v = fvecs_read_raw (filename, d)

% open the file and count the number of descriptors
fid = fopen (filename, 'rb');
 
if fid == -1
  error ('I/O error : Unable to open the file %s\n', filename)
end

% Read the vector size
vecsizeof = d * 4;

% Get the number of vectrors
fseek (fid, 0, 1);							% end of file
bmax = ftell (fid) / vecsizeof;				% ftell(fid) means the current position of the indicator
n=bmax;

fseek (fid, 0, -1);
v = fread (fid, d * n, 'float=>single');
v = reshape (v, d, n);							% return the (d)*n matrix
  
fclose (fid);