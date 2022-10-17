 exp = 1e5;

a = randi([1,3],exp,2);
b = a(1,1);
for i = 1:exp
    res(i) = (a(i,1) == 1) & (a(i,2)==2);
end
result = sum(res)/exp;