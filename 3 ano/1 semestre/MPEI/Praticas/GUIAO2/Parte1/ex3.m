% exercicio 3 -> parte 2.1

%alinea a)

N = 1e5;
n = 10;
t = 1000;

a = randi([1,t],N,n);

res = zeros(1,N);
for i = 1:N
    res(i) = length(unique(a(i,:)));
end

result = res == 10;
res = 1 - sum(result)/N;

fprintf("Resultado alinea a): %1.4f\n",res);



% alinea b)

loglog(t, res, 'r-*');
xticks(t);
yticks(0:100:1000);
xlim([0, t])



% alinea c)

