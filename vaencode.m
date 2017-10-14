function c=vaencode(bound, ninter, vec)
nv=size(vec, 2);
I=(bound(:,2)-bound(:,1))/ninter;
c=floor((vec-repmat(bound(:,1), 1, nv)) ./ repmat(I,1,nv));