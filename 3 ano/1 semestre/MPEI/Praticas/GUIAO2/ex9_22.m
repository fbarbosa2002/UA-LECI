%   exercicio 9 da parte 2.2

%   Distribuicao normal -> media = 14 e desvio padrao = 2

%   variavel aleatoria continua 

%   alinea a

disnormal = randn(1e3,1) ;
disnormal = (disnormal*2) + 14;

%histogram(disnormal);  %Histograma

m = mean(disnormal);    %Verificar media
s = std(disnormal);     %Verificar desvio padrao

cf = sum(disnormal>12 & disnormal<16) / 1e3 ;

fprintf("Probabilidae de um aluno do curso ter entre 12 e 16 e: %1.5f\n",cf);

%alinea b 

cf = sum(disnormal>10 & disnormal<18) / 1e3 ;

fprintf("Probabilidae de um aluno do curso ter entre 10 e 18 e: %1.5f\n",cf);

%alinea c

cf = sum(disnormal>=10) / 1e3;

fprintf("Probabilidae de um aluno passar de ano e: %1.5f\n",cf);
