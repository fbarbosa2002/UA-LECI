
clear all
% exercicio 3 -> parte 2.1

%alinea a)

N = 1e5;
n = 10;
t = 1000;

a = randi([0,t-1],n,N) ;

res = zeros(size(N));
for i = 1:N
    res(i) = length(unique(a(:,i))) ~= n;
end

res = sum(res)/N;

fprintf("Resultado alinea a): %1.4f\n",res);



% alinea b)
% Incrementei as keys de 10 a 10 ate 200
fprintf("\nResultado alinea b ->\n\tVer gráfico em popup\n")
keys = 0:10:100;
t = 1000 ;
for j = 1:length(keys)
    aux = keys(j) ;
    a = randi([0,t-1],aux,N) ;
    
    res = zeros(size(N));
    for i = 1:N
        res(i) = length(unique(a(:,i))) ~= aux;
    end
    final_result(j) = sum(res) / N ;
    
end
subplot(2,1,1)
plot(keys,final_result)
title("Alinea b)")

clear all
% alinea c)

fprintf("\nResultado alinea c ->\n\tVer gráfico em popup\n")
N = 1e5;

keys = 50 ;
T = 100:100:1000 ;

for i = 1:length(T)
    aux = T(i) ;
    a = randi([0,aux-1],keys,N) ;
    res = zeros(size(N)) ;
    for j = 1:N
        res(j) = length(unique(a(:,j))) ~= keys ;
    end

final_result(i) = sum(res) / N ;
end

subplot(2,1,2)
plot(T,final_result)
title("Alinea c)")
