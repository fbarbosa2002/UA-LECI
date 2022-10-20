% exercicio 8 da parte 2.2

% lambda = 0.02
% no maximo um erro num livro de 100 paginas

lambda = 0.02 * 100; 

soma = 0 ;
for k = 0:1
    soma = soma + ((lambda ^ k) / factorial(k)) * exp(-lambda) ;
end
   
fprintf("Probabilidade de, no maximo, um erro num livro de 100 paginas e : %1.5f",soma);