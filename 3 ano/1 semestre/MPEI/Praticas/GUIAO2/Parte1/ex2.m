% exercicio 2 -> parte 2.1



% alinea a)
m = 100 ; 
n = 20 ;
N = 10000;

experiencia = randi(m,n,N);

diferent = zeros(1,N);

for col = 1:N
    diferent(col)=length(unique(experiencia(:,col))) == n;
end

p1 = sum(diferent)/N;


fprintf("Resultado alinea a): %1.4f\n",p1);


% alinea b)
p2 = 1 - p1;

fprintf("Resultado alinea b): %1.4f\n",p2);



% alinea c)


m = [1000,100000];
n = 10:10:100;
probabilidades = zeros(size(N));

for j = 1:length(m)
    m1 = m(j);
    for nexp = n
        a = randi([1,m1],N,nexp);
        res = zeros(1,N);
        for i = 1:N
            res(i) = length(unique(a(i,:)));
        end
        favoraveis = res == nexp;
        probabilidades(nexp/10) = 1 - sum(favoraveis)/N;
    end
    subplot(2,1,j);
    plot(n, probabilidades);
end


% alinea d)
