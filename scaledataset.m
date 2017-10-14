function vs=scaledataset(v, lb, ub)
disp('do you put [v] and [q] together?');
lv=min(min(v));
uv=max(max(v));
lens=ub-lb;
lenv=uv-lv;

vs=(v-lv).*lens./lenv+lb;