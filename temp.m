d=size(bound,2);
boundary=[];
for i=1:d
    boundary=[boundary,[bound(1,i):interval(1,i):bound(2,i)]'];
end