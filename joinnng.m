prefix='/home/xkfeng/research/sknng/nng/sift1M_1000nng/block';
postfix='.ivecs';

iblock=36;
nng=[];

for iblock=36:99
    file = [prefix, num2str(iblock), postfix];
    blockv=ivecs_read(file);
    size(blockv)
    nng=[nng,blockv];
end

size(nng);