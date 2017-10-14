function m = calculate_m(c,n,w,delta)
p1=pro_collision(w,1);
p2=pro_collision(w,c);
z=calculate_z(n,delta);
m=ceil((log(1/delta)/log(exp(1)))/2/(p1-p2)^2 * (1+z)^2);