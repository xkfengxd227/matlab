function codev = lsh_encode(lsh, v)
% encode the [d x n] vector set with lsh functions

codev = int32(floor((lsh.a'*v+lsh.b)/lsh.w));
end

