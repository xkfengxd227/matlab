

% plot the query
query = sq(:,1);
bar(query);
axis([0,32,0,255]);

% plot the gt
figure;
for i=1:2
    for j=1:5
        idx = (i-1)*5 + j;
        idx
        subplot(2,5,idx);
        bar(sv(:,gt(idx, 1)));
        axis([0,32,0,255]);
    end
end


