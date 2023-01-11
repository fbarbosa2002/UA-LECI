
clear all
% ex 6 -> alinea a)

fprintf("\nExercicio 6 -> \n\tAlinea a) ->")

k = 2 ; % Numero de peças nao defeituosas 
N = 1e5 ; % NUMERO DE EXPERIENCIAS
n = 5 ; % AMOSTRA DE 5 PEÇAS
p = 0.3 ; % PROBABILIADE DE 0.3 DE SER DEFEITUOSA


probSimulacao = prob(k,n,p,N) ;

fprintf("\n\t\tPor simulação -> \n\t\t\tProbabilidade de sair 3 peças defeituosas em 5 é: %.4f\n",probSimulacao)

n = 5 ;
p = 0.3 ; 
k = 3 ;
prob = nchoosek(n,k)* (p^k) *(1-p)^(n-k) ;

fprintf("\n\t\tPor cálculo analítico -> \n\t\t\tProbabilidade de sair 3 peças defeituosas em 5 é: %.4f\n",prob)


% ex6 -> alinea b)

fprintf("\nExercicio 6 -> \n\tAlinea b) ->")


N = 1e5 ;
n = 5 ;
k = 3 ;
p = 0.3 ;

experiencia = rand(n,N) > p ;

result = sum(experiencia) >= k ;

final_result = sum(result) / N ;

fprintf("\n\t\tPor simulação -> \n\t\t\tProbabilidade de sair, no máximo, 2 peças defeituosas: %.4f",final_result)


n = 5 ;
p = 0.3 ; 
probTotal = 0 ;
aux =zeros(3,1) ;
for k = 0:2
  
    prob = nchoosek(n,k)* (p^k) *(1-p)^(n-k) ;

    probTotal = probTotal + prob ;
end

fprintf("\n\t\tPor cálculo analítico -> \n\t\t\tProbabilidade de sair, no máximo, 2 peças defeituosas: %.4f\n",probTotal)

% ex6 -> alinea c)
fprintf("\nExercicio 6 -> \n\tAlinea c) ->\n\t\tVer gráfico no popup\n")

p = 0.3;
n = 5;
N = 10e5;

for k = 0:n
    k;
    resultado(k+1) = sum(sum(rand(5, N) > p) == k)/N;
end
bar(0:n, resultado)




