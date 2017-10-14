function uv  = unit_vectors( v )
% convert each vector (in column) to unit vectors with length=1
% v: [d, n]
% nv: [d, n]
d = size(v,1);            % 
veclen = sqrt(sum(v.*v));           % norm of each vectors
uv = v./repmat(veclen,d,1);         % for each vector, divided by its length
end

