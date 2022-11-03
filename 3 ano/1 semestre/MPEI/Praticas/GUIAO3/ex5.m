% exercicio 5 -> parte 3.1

% alinea a)

T = [0.7 0.2 0.1 ; 0.2 0.3 0.5; 0.3 0.3 0.4] ;

fprintf("Alinea a)\nMatriz de transicao: \n")
disp(T)

% alinea b)
TT = T';
v = [1;0;0];
v2 = TT*v;
v3 = TT*v;

fprintf("Alinea b)\n : %1.4f, %1.4f\n",v2(1),v3(1))