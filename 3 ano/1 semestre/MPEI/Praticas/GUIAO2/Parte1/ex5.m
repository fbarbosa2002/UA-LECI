% exercicio 5 -> parte 2.1


% alinea a)

n = 1000000;
nlancamentos = 2 ;
experiencia = randi (6,nlancamentos,n) ;


% se soma dos dois dados for == 9

exp1 = sum(sum(experiencia) == 9) / n;

fprintf('Resultado alinea a) -> \n\tA  probabilidade da soma dos dois dados ser 9 e: %1.4f\n',exp1);






% segundo valor ser par

exp2 = sum(rem(experiencia(2,:),2) == 0) / n ; % rem == resto da divisao

fprintf('\tA  probabilidade do segundo valor ser par e: %1.4f\n',exp2);





% pelo menos um dos valores ser igual a 5

exp3 = experiencia == 5 ;

expfinal3 = sum(sum(exp3) >= 1) / n;

fprintf('\tA  probabilidade de pelo menos um valor ser igual a 5 e: %1.4f\n',expfinal3);





% nenhum valor igual a 1

exp4 = experiencia == 1;

expfinal4 = sum(sum(exp4) >= 1) / n ;

expfinal4 = 1 - expfinal4;


fprintf('\tA  probabilidade de nenhum valor ser igual a 1 e: %1.4f\n',expfinal4 );

