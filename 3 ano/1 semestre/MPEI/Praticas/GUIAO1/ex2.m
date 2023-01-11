
%ex2


N=10e5; % numero de experiencias 
n = 15; % numero de lancamentos
p = 0.5;% probabilidade de sair cara
k = 6 ; % numero de caras


lancamento = rand(n,N) > p ;

resulexper = sum(lancamento)== k;

resultfinal= sum(resulexper)/N ;

fprintf("\nEx2 ->\n\tProbabilidade de sair 6 caras em 15 lançamentos: %.4f\n",resultfinal)
