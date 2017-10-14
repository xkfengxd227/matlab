function [ dis, proj ] = odis_point_lines( v1, v2, p )
% calculate the distance between a point and a set of lines
%   @param      v1      first point of the lines
%   @param      v2      second point of the lines
%   @return     dis     distances
%   @return     proj    projections

[d,n]=size(v1);

dis = ones(1,n) * -1;
proj = zeros(d,n);

for i=1:n
    [dis(i), proj(:,i)] = odis_point_line(v1(:,i), v2(:,i), p); 
end

