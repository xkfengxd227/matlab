s=872;
w=[1:10000];
nw=size(w,2);
ps=zeros(1,nw);
p2s=zeros(1,nw);

for i=1:nw
    ps(i)=pro_collision(w(i),s);
    p2s(i)=pro_collision(w(i),2.23*s);
end

plot(w,ps,'-o');
xlabel('w');
ylabel('p(s)');

figure;
plot(w,ps-p2s,'-o');
xlabel('w');
ylabel('p(s)/p(2*s)');
