%ex3
function [probSimulacao]=prob(k,n,p,N)
% calculo de probabilidade
% Filipe, 22/09/2022




%N=10e6;
%p=0.5;
%k=6;
%n=15;

experiencia2 = rand(n,N);

lancamento = experiencia2 > p;

resulexper = sum(lancamento)== k;

resultfinal= sum(resulexper)/N;

probSimulacao = resultfinal*100;

end
