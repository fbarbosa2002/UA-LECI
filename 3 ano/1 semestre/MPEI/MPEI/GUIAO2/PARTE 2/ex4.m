exp = 1e5;
nPecas = 5;
sim = rand(nPecas,exp) <= 0.3;
defeito = sum(sim);
prob = zeros(1,nPecas + 1);
for i = 1:nPecas+1
    favoraveis = sum(defeito == i-1);
    prob(i)=favoraveis/exp;
end

subplot(2,1,1);
stairs(prob);
ylim([0,1]);
yticks(0:0.1:1);
xticks([0,1,2,3,4,5]);
%xticklabels(["0","1","2","3","4","5"]);

soma = 0;
resultAcumulado = zeros(1,nPecas+1);
for j= 1: nPecas+1
    soma = soma + prob(j);
    resultAcumulado(j) = soma;
end
subplot(2,1,2);
stairs(resultAcumulado);
ylim([0,1]);
yticks(0:0.1:1);
xticks([0,1,2,3,4,5]);

                        