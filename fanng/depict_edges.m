%% draw the edges in E, points from pts
function [ output_args ] = depict_edge( pts, E )
for i=1:size(E,2)
    annotation('arrow', ...
        [pts(1, uint32(E(1,i))), pts(1, uint32(E(2,i)))],...
        [pts(2, uint32(E(1,i))), pts(2, uint32(E(2,i)))]);
end
end
