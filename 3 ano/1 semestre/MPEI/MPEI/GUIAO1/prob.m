%Retorna a probalidade da simulaçao de um experimento
%
%
%
% prob(p,n,k,N)
%
%
% probSimulacao = prob(p,n,k,N)

function probSimulacao = prob(p,n,k,N)
lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos)==k;

probSimulacao = sum(sucessos)/N;