%% we realize the SK-LSH schema with [L=1]

% import 
addpath ..;
addpath ../common;
addpath ../lsh;

% parameters

% LSH construction
lsh = generate_compound_lsh(m, w, d, U);        % ###??? U?

% encoding
vcode=lsh_encode(lsh, v);

u=max(max(vcode));
l=min(min(vcode));

% report
fprintf('dsname=%s: m=%d, w=%f, u=%f, l=%f, range=%f\n', dsname, m, w, u, l, u-l+1);

