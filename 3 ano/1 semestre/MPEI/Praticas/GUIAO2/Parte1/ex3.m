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

keys = 0:10:200;
t = 10000 ;
for j = 1:length(keys)
    aux = keys(j) ;
    a = randi([0,t-1],aux,N) ;
    
    res = zeros(size(N));
    for i = 1:N
        res(i) = length(unique(a(:,i))) ~= aux;
    end
    final_result(j) = sum(res) / N ;
end
disp(final_result)
plot(keys,final_result)
% alinea c)

