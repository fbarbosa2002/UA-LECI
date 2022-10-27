% exercicio 4 -> parte 2.2

% alinea a)

nrexperiencias = 1e6 ;
fprintf("Resultado alinea a) -> \n")
for i = 0:5

    matriz0 = sum(sum(rand(5,nrexperiencias) < 0.3) == i) / nrexperiencias ;
    fprintf('f(%d)= %f ',i,matriz0);
end
stairs(matriz0)
ylim([0,1]);
yticks(0:0.1:1);
xticks([0,1,2,3,4,5]);
fprintf('\n');

