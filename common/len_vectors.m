function lens = len_vectors(v)
[d,n]=size(v);

lens=zeros(1, n);
for i=1:n
    lens(i) = norm(v(:,i));
end