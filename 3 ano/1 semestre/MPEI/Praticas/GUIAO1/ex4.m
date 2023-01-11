

% ex4 -> alinea a 
fprintf("\nExercicio 2 -> \n\tAlinea a)")

% Para 20 lançamentos
n = 20 ;
for moedas = 0:n
    probSimulacao(moedas + 1 ) = prob(moedas,n,0.5,1e5) ;
    fprintf("\n\tProbabilidade de sair %d caras em %d lançamentos: %.4f" , moedas,n,probSimulacao(moedas + 1))
end


% Para 40 lançamentos 
n = 40 ;
for moedas = 0:n
    probSimulacao(moedas + 1 ) = prob(moedas,n,0.5,1e5) ;
    fprintf("\n\tProbabilidade de sair %d caras em %d lançamentos: %.4f" , moedas,n,probSimulacao(moedas + 1))
end

% Para 100 lançamentos
n = 100 ;
for moedas = 0:n
    probSimulacao(moedas + 1 ) = prob(moedas,n,0.5,1e5) ;
    fprintf("\n\tProbabilidade de sair %d caras em %d lançamentos: %.4f" , moedas,n,probSimulacao(moedas + 1))
end

clear all


% ex4 -> alinea b 
fprintf("\n\tAlinea b)\n\tVerificar gráfico em popup\n")

n = 20 ;
for moedas = 0:n
    probSimulacao(moedas + 1 ) = prob(moedas,n,0.5,1e5) ;
end

stem(probSimulacao)
