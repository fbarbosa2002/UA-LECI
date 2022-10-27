% exercicio 7 parte 2.2
% alinea a

n = 15 ;
p = 1 ;
lambda = 15 ;

k = 0 ;

p7 = ((lambda ^ k) / factorial(k)) * exp(-lambda) ;

fprintf("Probabilidade de nao receber nenhuma mensagem e %1.15f\n",p7);
% alinea b
soma = 0 ;
for k = 0:10
    
    soma = soma + ((lambda ^ k) / factorial(k)) * exp(-lambda) ;

end


fprintf("Probabilidade de receber mais de 10 mensagens e %3.7f\n",soma);
