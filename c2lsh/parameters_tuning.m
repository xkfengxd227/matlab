% tuning the parameters of c2lsh, to see their real values

% all parameters
n = 1000000;
d = 128;

w = 2.184;
c = 2;                                              % or 3
p1 = pro_collision(w, 1);           % p1 = p(1)
p2 = pro_collision(w, c);           % p2 = p(c), p2 < p1
delta = 1/exp(1);                                   % error probability: 0 < delta < 1/2
v = [100:100:1000];                                            % how many false positives
beta = v / n;                                   % rate of false positives

z = sqrt(log(2./beta)/log(1/delta));
alpha = (z*p1+p2) ./ (1+z);          % threshold of collision
m = ceil(log(1/delta)*(1+z).^2 ./ (2*(p1-p2)^2));

l = m.*alpha;                                % number of threshold
Ct = pro_collision(w,c^2)/p1*alpha.*m;       % fast c2lsh: candidate criteria


% show parameters
hold on;
plot(v, m);
plot(v, l);
plot(v,Ct);
