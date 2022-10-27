% exercicio 4 -> parte 2.1


% alinea a) 
N = 1e5;
for n = 10:100
    
    aniversarios = randi([1,365],N,n);
    c = zeros(1,N);

    for i = 1:exp
        c(i) = length(unique(aniversarios(i,:)));
    end
    
    favoraveis = c == n;
    prob = 1 - sum(favoraveis)/N;
    
    if (prob > 0.5)
        break;
    end
end

fprintf("Resultado alinea a): %d\n",n);