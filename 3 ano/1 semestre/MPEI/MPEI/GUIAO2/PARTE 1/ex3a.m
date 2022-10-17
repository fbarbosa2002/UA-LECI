exp = 1e5;
n = 10;
t = 1000;

a = randi([1,t],exp,n);
res = zeros(1,exp);
for i = 1:exp
    res(i) = length(unique(a(i,:)));
end

result = res == 10;
res = 1 - sum(result)/exp;