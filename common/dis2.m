% euclidean distance between two vectors
function dis = dis2(va, vb)
dis = pdist([va,vb]', 'euclidean');