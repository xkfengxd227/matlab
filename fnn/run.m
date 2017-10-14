% check out the trend of sub-order mu-std distance to the original distance
% on [color]

addpath ..

% figure out mu-std for base and query
us1 = mustd_order(v, 1);
us2 = mustd_order(v, 2);
us4 = mustd_order(v, 4);
us8 = mustd_order(v, 8);
us16 = mustd_order(v, 16);

qus1 = mustd_order(q, 1);
qus2 = mustd_order(q, 2);
qus4 = mustd_order(q, 4);
qus8 = mustd_order(q, 8);
qus16 = mustd_order(q, 16);

% figure out distance
qi = randi(nq);
dis1=odis_query_dataset(us1,qus1(:,qi));
dis2=odis_query_dataset(us2,qus2(:,qi));
dis4=odis_query_dataset(us4,qus4(:,qi));
dis8=odis_query_dataset(us8,qus8(:,qi));
dis16=odis_query_dataset(us16,qus16(:,qi));
dis=odis_query_dataset(v,q(:,qi));

usdis=[dis1;dis2;dis4;dis8;dis16;dis];

% show
show
