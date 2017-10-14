function dis_n = odistance_n(v, vv)
n=size(v, 2);
d=size(v, 1);
if n ~= size(vv, 2) && d ~= size(vv, 1)
    fprintf('vectors dismatch');
    return;
end
diff=v-vv;
square=diff.*diff;
dis=sum(square,1);
dis_n=(sqrt(dis)); 