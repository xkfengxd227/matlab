%% test for C2LSH in one-time collision

close all;

%% ��������
addpath ../common; addpath ..;
% nn search parameters
np=1000;                % number of data points to load
nks=[1,10,40,70,100];      % number of nns to return
nnk=size(nks,2);
nq=50;                 %%% query number

% load relative data
%dsname=[];
%loaddata;

% lsh parameters: m,w,b,a
lsh.m=200;               %%% lsh number
lsh.w=0.01;              %%% interval length
% rand('seed',1);         % random starts from the same
lsh.b=rand()*lsh.w;     % b~u(0,w)
lsh.b = lsh.b + sqrt(d) * U;
                        % shift all hash values to positive
lsh.a=[];               % random projection vectors
% randn('seed',1);
rawa=randn(d,lsh.m);
lsh.a=norm_vectors(rawa);

%% LSH encoding
lsh.x=uint32(floor((lsh.a'*v+lsh.b)/lsh.w));
lsh.qx=uint32(floor((lsh.a'*q+lsh.b)/lsh.w));

%% knn search
headrank = zeros(nnk, nq);      % the best rank of a nn
tailrank = zeros(nnk, nq);      % the worst rank of a nn
for qi=1:nq
    qi
    % the qi-th query
    qx=lsh.qx(:,qi);            % extract the query code
    
    % to colliside
    diff=repmat(qx,1,n)-lsh.x;  % [m,n]
    counter=sum(diff==0);       % [1,n] collision time = number of zeros
    
    % collect headrank and tailrank for all knns
    parfor ki=1:nnk
        headrank(ki, qi) = sum(counter > counter(gt(nks(ki), qi)));
        tailrank(ki, qi) = sum(counter >= counter(gt(nks(ki), qi)));
    end
    
%     for ki=1:nnk
%         % for the [k]-th nn
%         k = nks(ki);
%         gtid=gt(k,qi);              % gt ID for [qi]'s [k]-th nn
%         cnt_kthnn = counter(gtid);	% collision count of the [k]th nn
%         
%         headrank(ki, qi) = sum(counter>cnt_kthnn);      % headrank: number of points whose cc > [k]-th nn's
%         tailrank(ki, qi) = sum(counter>=cnt_kthnn);     % tailrank: number of points whose cc >= [k]-th nn's
%     end
%     cnt_kthnn
        
%       load Np real points to verify candidates
%     [B,I]=sort(counter,'descend');
%     cand=I(1:np);
%     canddis=odis_query_dataset(v(:,cand),q(:,qi));
%     [B,I]=sort(canddis);
%     knn=cand(I(1:k));
%     knndis=B(1:k)';
% 
%     accuracy_knn(gt,gtdis,knn,knndis,1,k);

end

% average head/tail ranks
if nq>1
    avgheadrank = mean(headrank')';
    avgtailrank = mean(tailrank')';
else
    avgheadrank=headrank;
    avgtailrank=tailrank;
end

% depict
figure;
semilogy(nks(1:nnk),[avgheadrank,avgtailrank],'-o');
title([dsname, ', m=', num2str(lsh.m), ', w=', num2str(lsh.w)]);
xlabel('k');
ylabel('head/tail rank');
legend('head rank', 'tail rank');

figure;
plot(nks(1:nnk),[avgheadrank,avgtailrank],'-o');
title([dsname, ', m=', num2str(lsh.m), ', w=', num2str(lsh.w)]);
xlabel('k');
ylabel('head/tail rank');
legend('head rank', 'tail rank');

% collect average headranks for different [w]s
avgrank_w=[avgrank_w;[lsh.w,mean(avgheadrank),std(avgheadrank)]];
avgrank_w=sortrows(avgrank_w,1);

