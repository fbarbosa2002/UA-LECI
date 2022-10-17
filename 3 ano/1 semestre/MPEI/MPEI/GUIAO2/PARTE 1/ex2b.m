exp = 1e5;
n = 20;
m = 100;
a = randi([1,m],exp,n);
res = zeros(1,exp);
for i = 1:exp
    res(i) = length(unique(a(i,:)));
end
result = res == 20;
res = 1 - sum(result)/exp;