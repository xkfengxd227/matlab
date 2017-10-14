function showlb(x,y)
xi=[1,2,3,5,10,12,20,30,60];
yi=zeros(1,9);

for i=1:9
    yi(i)=lowerbound(x,y,xi(i));
    [xi(i),yi(i)]
end

plot(xi,yi,'--*');