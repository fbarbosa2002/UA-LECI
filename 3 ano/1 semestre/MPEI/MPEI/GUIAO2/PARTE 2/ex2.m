%2a)
%5 euros 0.9
%50 euros 0.09
%100 euros 0.01

%2b)
n5 = 5*ones(1,90);
n50 = 50*ones(1,9);
n100 = 100*ones(1,1);

aux = horzcat(n5,n50,n100);
aux2 = aux(randperm(length(aux)));
notas = [5,50,100];
probs = [0.9,0.09,0.01];
subplot(2,1,1);
bar(probs);
ylim([0,1]);
yticks(0:0.1:1);
xticklabels({'5','50','100'});

%2c)
soma = 0;
resultAcumulado = zeros(1,3);
for i = 1:3
    soma = soma + probs(i);
    resultAcumulado(i) = soma;
end

subplot(2,1,2);
stairs(resultAcumulado);
xticks([5,50,100]);
ylim([0,1.2]);