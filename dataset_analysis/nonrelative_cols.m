% figure out the near minimum dims that can represent others
% 

reg = zeros(1,d);

for i=1:d
    pos = coor(i,1);
    if reg(pos) == 0
        reg(pos) = coor(i,2);
    end
end
