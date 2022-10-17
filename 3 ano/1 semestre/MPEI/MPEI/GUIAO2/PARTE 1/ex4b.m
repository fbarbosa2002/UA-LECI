exp = 1e5;

for n = 10:100
    aniversarios = randi([1,365],exp,n);
    c = zeros(1,exp);
    for i = 1:exp
        c(i) = length(unique(aniversarios(i,:)));
    end
    favoraveis = c == n;
    prob = 1 - sum(favoraveis)/exp;
    if (prob>0.9)
        break;
    end
end
disp(n);