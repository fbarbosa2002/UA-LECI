numeroexperiencia = 1e6 ;

matriz = randi(3,2,numeroexperiencia);
calcl = sum(matriz(1,:) == 1 & matriz(2,:) == 2)/numeroexperiencia;


disp(calcl);