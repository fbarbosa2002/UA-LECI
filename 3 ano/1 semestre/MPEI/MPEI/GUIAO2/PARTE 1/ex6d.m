exp = 1e5;
m1 = randi([1,3],1,exp);
m2 = randi([1,3],1,exp);

AB = ((m1==1) & (m2==2)) | ((m1==2) & (m2==1));
fAB = sum(AB,1);
B = (m1==2) | (m2==2);
fB = sum(B,1);
p = fAB/fB;