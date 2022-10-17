exp = 1e5;
n = 5;
experimentos = randi([0,1000],n,exp);
lancamentos = experimentos <= 2;
probTotal = zeros(1,6);
aux = zeros(1,6);
for i = 1:6
    %probTotal(i) = sum(lancamentos == i-1)/exp;
end
t = 0.08 + 0.24 + 0.48 + 0.2

T = [14/20 0 0.1 0.0667 0.08;
    3/20 1 0.1 0.0667 0.24;
    0 0 0.6 0 0;
    3/20 0 0.1 0.8 0.48;
    0 0 0.1 0.0667 0.2];
can = T([1 3 4 5 2][1 3 4 5 2]);
x = [1,0,0,0,0]';
for i = 2:10
    x = T * x;
end
%T2 = T^10;
