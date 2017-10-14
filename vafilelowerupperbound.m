function lub=vafilelowerupperbound(boundary, query, code)
d=size(query, 1);
lub=zeros(2,1);
diff=zeros(2,d);
for i=1:d
    lower=boundary(code(i),i);
    upper=boundary(code(i)+1,i);
    if query(i) < lower
        diff(1,i)=lower-query(i);
        diff(2,i)=upper-query(i);
    elseif query(i) > upper
            diff(1,i)=query(i)-upper;
            diff(2,i)=query(i)-lower;
    else
        diff(1,i)=0;
        if upper-query(i) > query(i) - lower
            diff(2,i)=upper-query(i);
        else
            diff(2,i)=query(i)-lower;
        end
    end
end
lub(1,1)=diff(1,:)*diff(1,:)';
lub(2,1)=diff(2,:)*diff(2,:)';