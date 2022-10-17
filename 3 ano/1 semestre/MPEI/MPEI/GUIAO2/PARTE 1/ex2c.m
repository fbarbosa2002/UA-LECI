exp = 1e5;

M = [1000,100000];
N = 10:10:100;
probabilidades = zeros(size(N));

for j = 1:length(M)
    m = M(j);
    for n = N
        a = randi([1,m],exp,n);
        res = zeros(1,exp);
        for i = 1:exp
            res(i) = length(unique(a(i,:)));
        end
        favoraveis = res == n;
        probabilidades(n/10) = 1 - sum(favoraveis)/exp;
    end
    subplot(2,1,j);
    plot(N, probabilidades);
end