% exercicio 4 -> parte 2.1


% alinea a) e b)
N = 1e5; % numero de experiencias
aux = 0 ;
for n = 10:100 % numero de pessoas
    
    aniversarios = randi([1,365],n,N);

    c = zeros(1,N);

    for i = 1:N
        c(i) = length(unique(aniversarios(:,i))) ~= n;
    end
    
    
    prob = sum(c)/N ;
    
    if (prob > 0.5)
        if aux  == 0 
            aux = n ;
        end 
    end

    if (prob > 0.9)
        break
    end

end

fprintf("Resultado alinea a): %d\n",aux);
fprintf("Resultado alinea b): %d\n",n);
