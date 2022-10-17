exp = 1e5;

t = (100:100:1000);
n = 50;
probabilidades = zeros(size(t));

for j = 1:length(t)
    a = randi([1,t(j)],exp,n);
    res = zeros(1,exp);
    for i = 1:exp
        res(i) = length(unique(a(i,:)));
    end
    favoraveis = res == n;

    probabilidades(j) = 1 - sum(favoraveis)/exp;
end
loglog(t,probabilidades,'r-*');
xticks(t);
yticks(0:0.1:1);
xlim([t(1), t(length(t))]);