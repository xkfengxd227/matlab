%% ����Ϊs����������Ͱ��w�ϵ���ײ����
function p=pro_collision(w,s)
tmp=w/s;
p=1 - 2*normcdf(-tmp) - 2/(sqrt(2*pi)*tmp)*(1-exp(-0.5*tmp*tmp));