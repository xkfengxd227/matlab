function lsh = generate_compound_lsh(m, w, d, U)
%   this function generate a compound LSH functions
%   @param  U       maxinum range of the dataset
%   @result lsh

lsh.m = m;
lsh.w = w;
% [b] make sure to shift all hash values to positive
lsh.b = rand() * lsh.w;% + sqrt(d) * U;

% random projection vectors
% lsh.a = unit_vectors(randn(d,lsh.m));
lsh.a = randn(d, lsh.m);

end

