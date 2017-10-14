function [dis, p_proj] = odis_point_line( p1, p2, p )
% distance between a point and a line, the line is determined by two
% points(lb and le)
%   @param  p1  begin point of the line
%   @param  p2  end point of the line
%   @return p_proj  the projection point of p on the line

p_proj = ((p-p1)'*(p2-p1))/(norm(p2-p1)^2)*(p2-p1);

proj_to_p = (p-p1) - p_proj;

dis = norm(proj_to_p);

end

