% test speed between [loop in matlab] and [loop in c]

d = 32;
n = 60000;
v = single(rand(d,n)-0.5);

tic;
cnt_m = zeros(1,n);
for i=1:n
    cnt_m(i) = sum(v(:,i)>0);
end
toc;

tic;
cnt_mm = sum(v>0);
toc;

tic;
cnt_c = xikafe_count_positive(v);
toc;

cnt_m = int32(cnt_m);
cnt_mm = int32(cnt_mm);
sum(cnt_m-cnt_c)
sum(cnt_mm-cnt_c)