n = 1000000;
nlancamentos = 2 ;
experiencia = randi (6,nlancamentos,n);


% se soma dos dois dados for == 9

exp1 = sum(sum(experiencia) == 9) / n;

disp('A  probabilidade da soma dos dois dados ser 9 e: ');
disp(exp1);





% segundo valor ser par

exp2 = sum(rem(experiencia(2,:),2) == 0) / n ; % rem == resto da divisao

disp('A  probabilidade do segundo valor ser par e: ');
disp(exp2);





% pelo menos um dos valores ser igual a 5

exp3 = experiencia == 5 ;

expfinal3 = sum(sum(exp3) >= 1) / n;

disp('A  probabilidade de pelo menos um valor ser igual a 5 e: ');
disp(expfinal3);





% nenhum valor igual a 1

exp4 = experiencia == 1;

expfinal4 = sum(sum(exp4) >= 1) / n ;

expfinal4 = 1 - expfinal4;


disp('A  probabilidade de nenhum valor ser igual a 1 e: ' );
disp(expfinal4);
