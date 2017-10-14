function sorted_vecs = sort_vectors_in_lex_order(vecs)
% sort n d-dim vectors in lex order:
% e.g.:
%   [[2,2,2], [3,2,1], [1,2,3]] to 
%   [[1,2,3], [2,2,2], [3,2,1]]
%
% @param    vecs    [d x n]

sorted_vecs = xikafe_sort_vectors_in_lex_order(vecs);

end

