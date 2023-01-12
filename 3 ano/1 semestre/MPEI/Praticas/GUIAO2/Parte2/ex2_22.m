% exercicio 2 -> parte 2.2

% alinea a)

% 90 notas de 5 // 9 notas de 50 // 1 nota de 100
% 100 notas no total 
% notas de 5 - 90 /100 - 0.9
% notas de 50 - 9 /100 - 0.09
% notas de 100 - 1/100 - 0.01


% alinea b)

nr5 = 5 * ones(1,90);
nr50 = 50 * ones(1,9);
nr100 = 100 * ones(1,1) ; 

aux = [nr5,nr50,nr100] ;

aux2 = aux(randperm(100)) ; % distribui aleatoriamente os numeros da matriz aux

experiencia1 = sum(aux2 == 5) / 100 ;
experiencia2 = sum(aux2 == 50) / 100 ;
experiencia3 = sum(aux2 == 100) / 100 ;

fprintf('Probabilidade de sair uma nota de 5 e : %1.4f\n',experiencia1) ;

fprintf('Probabilidade de sair uma nota de 50 e : %1.4f\n',experiencia2) ;


fprintf('Probabilidade de sair uma nota de 100 e : %1.4f\n',experiencia3) ;

% alinea c)

x = [5 50 100] ;
px= [90/100 9/100 1/100] ;
subplot(2,1,1)
stem(x,px) ;
xlim([1,110])
ylim([0,1.2])

fx = cumsum(px);
subplot(2,1,2)
stairs([0 x 100], [0 fx 1])

ylim([0 1.1])


