exp = 1e5;
n = 20;
m = 100;
a = randi([1,m],exp,n);
aux = zeros(1,exp);
for i = 1:exp
    aux(i) = length(unique(a(i,:)));
end
result = aux == 20;
res = sum(result)/exp;

