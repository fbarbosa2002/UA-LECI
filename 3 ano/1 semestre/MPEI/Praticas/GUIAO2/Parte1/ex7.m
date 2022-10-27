% exercicio 7 -> parte 2.1

ntentativas = 100;

progA = rand(20, ntentativas) < 0.01 ;
progB = rand(30, ntentativas) < 0.05 ;
progC = rand(50, ntentativas) < 0.001 ;

experiencia = [progA ; progB ; progC] ;

exp2 = sum(sum(progC)) ;
exp3 = sum(sum(experiencia)) ;
prob = exp2 / exp3 ; 

fprintf('A probabilidade de conter um erro e o programa escolhido ser o do Carlos e: %1.4f\n',prob) ;
