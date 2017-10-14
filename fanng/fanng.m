%% test of fanng

% config
n = cfg.n;
d = cfg.d;
pts = cfg.pts;

% if results already exist
if ~isfield(cfg, 'E')
    % storing edges
    E = [];

    tic;
    % compute all <i,j> pair distances
    tbl = zeros(n,n);
    for i=1:n
        for j=i:n
            tbl(i,j) = pdist([pts(:,i),pts(:,j)]', 'euclidean');
            tbl(j,i) = tbl(i,j);
        end
    end
    toc;

    tic;
    % constructing
    for pi=1:n
        e = [];
        Pi = pts(:,pi);
        % compute the distance between each other points to Pi
        for pj = 1:n
            if pj ~= pi
                Pj = pts(:,pj);
                e = [e, [pi; pj; tbl(pi,pj)]];
            end
        end

        % sort each edges in ascending order
        e = sortrows(e', 2)';

        % check to add new edges
        for ei=1:size(e,2)
            u = uint32(e(2,ei));        % pick a p3 to check
            L = e(3,ei);                % dist(p1,p3)
            ocl = false;
            % traverse each edges that has been added
            for Ei=1:size(E,2)
                % ocl = true: <p2,p3> < L
                v = uint32(E(2,Ei));
                if uint32(E(1,Ei)) == pi && L > tbl(u,v)
                    ocl = true;
                    break;
                end
            end

            if ~ocl
                E = [E, [pi; u]];
            end
        end
    end
    toc;

    % save edges
    cfg.E = E;
end

% show all points and edges
tic;
figure;
depict_edges(pts, E);
% plot(pts(1,:), pts(2,:), 'ro');
% text(pts(1,:)+0.01, pts(2,:), num2str([1:n]'));
toc;

