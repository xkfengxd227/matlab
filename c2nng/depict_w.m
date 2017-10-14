%% …Ë÷√w
c=[1:0.05:2];
w=sqrt(8*c.*c.*log(c)./log(exp(1))./(c.^c-1));

plot(c,w, 'o')
w