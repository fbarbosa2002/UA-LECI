% exercicio 3 -> parte 2.2


% alinea a)
nrexperiencias = 1e6 ;

for i = 0:4

    matriz0 = sum(sum(rand(4,nrexperiencias) < 0.5) == i) / nrexperiencias ;
    fprintf('f(%d)= %f ',i,matriz0);
end

fprintf('\n');

% alinea b)

% valor esperado = E[x]
% E[X] = somatorio xi pxi
% E[X] = 0 * 0.0625 + 1*0.25 + 2*0.375 + 3*0.25 + 4 *0.0625
% E[X] = 2

% Variancia = var[x] = E[x exp2] - E[x]exp2

% E[x] exp2 = 2 exp2 = 4
% E[x exp2] = 1*1*0.25 + 2*2*0.375 + 3*3*0.25 + 4*4*0.0625 
% E[x exp2] = 5

% var[x] = 5 -4 = 1
% desvio padrao = sqrt(var[x])
% desvio padrao = sqrt(1) = 1


