%ex3

N=10e5; % numero de experiencias 
n = 15; % numero de lancamentos
p = 0.5;% probabilidade de sair cara
k = 6 ; % numero de caras

experiencias = rand(n,N) > p;

result = sum(experiencias) >= k;

resultfinal = sum(result)/N;

fprintf("\nEx3 ->\n\tProbabilidade de sair , pelo menos, 6 caras em 15 lançamentos: %.4f\n",resultfinal)

