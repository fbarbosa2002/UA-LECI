%exercicio 1 -> parte 2.1

% alinea a)

N = 100000;
n = 2; % 2 filhos cada familia
       
% 1 -> rapaz 
% 0 -> rapariga
experiencia = rand(n,N) > 0.5;

resultado = sum(experiencia) >= 1;

resfinal = sum(resultado)/N;

fprintf("Resultado alinea a): %1.4f\n",resfinal); 



%alinea b)

% valor_teórico = numero de casos favoráveis/ numero de casos possiveis
valor_teorico = 3/4;
% casos possiveis =(MM,MF,FF,FM) -> M -- filho 
%                                   F -- filha

fprintf("Resultado alinea b): %1.4f\n",valor_teorico);



% alinea c)
% Probabiliade condional -> qual a probabilidade de ter um filho rapaaz
% sabendo que o outro ja é rapaz
% P (A | B) = P (A e B) / P(B)
% 

n = 2; % numero de filhos

exp = rand(n,N) > 0.5;

exp1 = sum(exp)==2;

exp2 = sum(exp) >=1;

sum_exp1 = sum(exp1)/N;

sum_exp2 = sum(exp2)/N;

expfinal = sum_exp1 /sum_exp2;

fprintf("Resultado alinea c)(Por simmulacao): %1.4f\n", expfinal);
valor_teorico = 1/3;
fprintf("Resultado alinea c)(Teorico): %1.4f\n", valor_teorico);



% alinea d)



exp = rand(2,N) > 0.5;

expfinal = exp(1,:) == 1;
expb = sum(exp) == 2 ;

result = expb / expfinal;

fprintf("Resultado alinea d): %1.4f\n", result);




% alinea e)


exp = rand(5,N) >0.5;

exp1 = sum(exp) >= 1;

exp2 = sum(exp) == 2;

sum_exp1 = sum(exp1) / N;

sum_exp2 = sum(exp2) / N;

expfinal = sum_exp2 / sum_exp1; 

fprintf("Resultado alinea e): %1.4f\n", expfinal);



% alinea f)

exp2 =  sum(exp) >= 2;

sum_exp2 = sum(exp2) / N;

expfinal = sum_exp2 / sum_exp1 ;

fprintf("Resultado alinea f): %1.4f\n", expfinal);

