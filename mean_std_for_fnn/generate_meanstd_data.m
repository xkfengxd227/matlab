[d,n]=size(v);
meanstd = zeros(42,n);

% mean std for total-1 block
meanstd(1:2,:)=[mean(v); std(v)];

% mean std for total-4 block
b = 4;
bsize = d / b;
for bi=1:b
    bbegin = (bi-1)*bsize+1;
    bend = bi*bsize;
    meanstd(2+(bi-1)*2+1:2+bi*2,:) = [mean(v(bbegin:bend,:)); std(v(bbegin:bend,:))];
end

% mean std for total-16 block
b = 16;
bsize = d / b;
for bi=1:b
    bbegin = (bi-1)*bsize+1;
    bend = bi*bsize;
    meanstd(10+(bi-1)*2+1:10+bi*2,:) = [mean(v(bbegin:bend,:)); std(v(bbegin:bend,:))];
end