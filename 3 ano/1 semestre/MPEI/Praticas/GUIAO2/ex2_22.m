% ex2a 

% 90 notas de 5 // 9 notas de 50 // 1 nota de 100
% 100 notas no total 
% notas de 5 - 90 /100 - 0.9
% notas de 50 - 9 /100 - 0.09
% notas de 100 - 1/100 - 0.01


% EX2B

nr5 = 5 * ones(1,90);
nr50 = 50 * ones(1,9);
nr100 = 100 * ones(1,1) ; 

aux = horzcat(nr5,nr50,nr100) ;

aux2 = aux(randperm(100)) ; % distribui aleatoriamente os numeros da matriz aux

experiencia1 = sum(aux2 == 5) / 100 ;
experiencia2 = sum(aux2 == 50) / 100 ;
experiencia3 = sum(aux2 == 100) / 100 ;

disp('Probabilidade de sair uma nota de 5 e : ') ;
disp(experiencia1) ;

disp('Probabilidade de sair uma nota de 50 e : ') ;
disp(experiencia2) ;

disp('Probabilidade de sair uma nota de 100 e : ') ;
disp(experiencia3) ;

%ex2c

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


