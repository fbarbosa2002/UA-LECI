%exercicio 6 -> parte 2.1

% alinea a)

numeroexperiencia = 1e6 ;

matriz = randi(3,2,numeroexperiencia);
calcl = sum(matriz(1,:) == 1 & matriz(2,:) == 2)/numeroexperiencia;

fprintf("Resultado alinea a): %1.4f\n",calcl)



% alinea b)

calcl = sum(sum(matriz(1,:) == 1 | matriz(2,:) == 1))/numeroexperiencia;

fprintf("Resultado alinea b): %1.4f\n",calcl)



% alinea c)

calcl = sum(sum(matriz == 1 | matriz == 2 ))/numeroexperiencia;

fprintf("Resultado alinea c): %1.4f\n",calcl)

