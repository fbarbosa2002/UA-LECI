exp = 1e5;

M = [2e2, 5e2, 1e3, 2e3, 5e3, 1e4, 2e4, 5e4, 1e5]; %numero de alvos
n = 100;
probabilidades = zeros(size(M));

for j = 1:length(M)
    m = M(j);
    a = randi([1,m],exp,n);
    res = zeros(1,exp);
    for i =1:exp
        res(i) = length(unique(a(i,:)));
    end
    favoraveis = res == n;

    probabilidades(j) = 1 - sum(favoraveis)/exp;
end
loglog(M, probabilidades,'r-*');
xticks(M);
yticks(0:0.1:1);
xlim([M(1), M(length(M))]);