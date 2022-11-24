% exercicio 2 // Parte 3.1

% alinea a)

% estados -> faltar // nao faltar 
% estado 1 -> faltar
% estado 2 -> nao faltar

% transicao -> faltar -> nao faltar : 0.8           -> t2/1
%              faltar -> faltar : 0.2               -> t1/1
%              nao faltar -> faltar : 0.3           -> t1/2
%              nao faltar -> nao faltar : 0.7       -> t2/2


matriz = [0.2 0.3; 0.8 0.7];

sum(matriz);

% vetor estado -> nao faltar -> faltar/nao faltar 

v = [0;1];

v1 = matriz * v;
v2 = matriz * v1;
v3 = v2(2);

fprintf("Probabilidade alinea a e b: %1.4f\n",v3);

% alinea c)

v = [0 1];

v1 = v * matriz^29;
v1 = v1(1);
fprintf("Probabilidade alinea c: %1.4f\n",v1);

% alinea d)

PNFaltar = 0.85;

v1 = [1-PNFaltar PNFaltar];




prob= zeros(1,30);


v = v1;


for aula = 2:30
    
    v = v * matriz;
    prob(aula)= v(1);

end    

plot(1:30,prob,'b*:');
fprintf("Alinea d): Grafico")