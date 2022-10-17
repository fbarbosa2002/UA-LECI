N = 1e5; %numero de experiências
p = 0.5; %probabilidade de cara
%k = 6:15; numero de caras
n = 15; %numero de lançamentos
probTotal = 0;
for k = 6:15
    lancamentos = rand(n,N) > p;
    sucessos = sum(lancamentos)== k;
    probSimulacao = sum(sucessos)/N;
    probTotal = probTotal + probSimulacao;
end