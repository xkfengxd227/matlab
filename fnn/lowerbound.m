function lb = lowerbound(x, y, ndvd)

d = size(x,1);
nlen=ceil(d/ndvd);

% x,y每一个区块的参数
xpara=zeros(2,ndvd);
ypara=zeros(2,ndvd);
for i = 1:ndvd
    xunit=x((i-1)*nlen+1:i*nlen,:);
    yunit=y((i-1)*nlen+1:i*nlen,:);
    
    xpara(1,i)=mean(xunit);
    xpara(2,i)=sqrt(var(xunit)*(nlen-1)/nlen);
    ypara(1,i)=mean(yunit);
    ypara(2,i)=sqrt(var(yunit)*(nlen-1)/nlen);
end

lb=0;
for i=1:ndvd
    lb = lb + pdist([xpara(:,i),ypara(:,i)]', 'euclidean')^2;
end
lb=lb*nlen;
