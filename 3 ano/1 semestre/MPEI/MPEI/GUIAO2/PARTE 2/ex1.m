%1a)

exp = 1e5;
faces = 6;
jogadas = randi([1,6],1,exp);
favoraveis = zeros(1,faces);
for i = 1:faces
    favoraveis(i) = sum(jogadas == i);
end
result = favoraveis ./ exp;

subplot(2,1,1);
bar(1:faces, result);
ylim([0,1]);
yticks(0:0.1:1);
xticks(1:6);

%1b)
resultAcumulado = zeros(1,faces);
soma = 0;
for i = 1:faces
    soma = soma + result(i);
    resultAcumulado(i) = soma;
end

subplot(2,1,2);
stairs(resultAcumulado);
xticks(1:6);
