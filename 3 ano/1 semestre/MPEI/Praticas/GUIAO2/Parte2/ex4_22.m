% exercicio 4 -> parte 2.2
clear all
% alinea a)

nrexperiencias = 1e6 ;
fprintf("Resultado alinea a) -> \n")
for i = 0:5

    matriz0(i+1) = sum(sum(rand(5,nrexperiencias) < 0.3) == i) / nrexperiencias ;
    fprintf('f(%d)= %1.4f\n',i,matriz0(i+1));
end
stairs(cumsum(matriz0))
ylim([0,1]);
yticks(0:0.1:1);
xticks([0,1,2,3,4,5]);
fprintf('\n');

fprintf("\nProbabilidade de, no máximo, 2 das peças serem defeituosas: ")


    matriz = sum(sum(rand(5,nrexperiencias) < 0.3) <= 2) / nrexperiencias ;
    disp(matriz)
