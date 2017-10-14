function base = generate_orth_vector_pair(d)
% generate a pair of d-dim vectors

A = rand(d);
pc = princomp(A);
base = pc(:,1:2);