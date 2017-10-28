%% multi legends
[legh,objh,outh,outm]=legend(c1,'class1:train');
set(legh,'Box','off');
set(legh,'position',[0.2,0.8,0.1,0.1]);

legh2=copyobj(legh,gcf);
[legh2,objh2]=legend(c2,'class1:test');
set(legh2,'Box','off');
set(legh2,'position',[0.4,0.8,0.1,0.1]);

 legh3=copyobj(legh2,gcf);
 [legh3,objh3,outh3,outm3]=legend(c3,'class2:train');
 set(legh3,'Box','off');
 set(legh3,'position',[0.2,0.75,0.1,0.1]);

legh4=copyobj(legh3,gcf);
 [legh4,objh4]=legend(c4,'class2:test');
 set(legh4,'Box','off');
 set(legh4,'position',[0.4,0.75,0.1,0.1]);

 legh5=copyobj(legh4,gcf);
 [legh5,objh5,outh5,outm5]=legend(c5,'class3:train');
 set(legh5,'Box','off');
  set(legh5,'position',[0.2,0.7,0.1,0.1]);

 legh6=copyobj(legh5,gcf);
 [legh6,objh6]=legend(c6,'class3:test');
 set(legh6,'Box','off');
   set(legh6,'position',[0.4,0.7,0.1,0.1]);