function slt = randselect(n, nslt)
% random select [nslt] indices from [1:n]

seed=randperm(n);
slt=seed(1:nslt);
end

