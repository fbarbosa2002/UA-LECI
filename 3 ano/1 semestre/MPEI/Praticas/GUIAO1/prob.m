%ex3
function probSimulacao =prob(k,n,p,N)
% calculo de probabilidade
% Filipe, 22/09/2022


    experiencia2 = rand(n,N) > p;


    resulexper = sum(experiencia2)== k;

    probSimulacao = sum(resulexper)/N;


end
