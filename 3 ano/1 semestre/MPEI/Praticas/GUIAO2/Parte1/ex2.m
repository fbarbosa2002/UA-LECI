% exercicio 2 -> parte 2.1



% alinea a)
m = 100 ; % numero de alvos
n = 20 ;  % numero de dardos 
N = 10000;% numero de tentativas

experiencia = randi(m,n,N) ;

diferent = zeros(1,N);

for col = 1:N
    
    diferent(col) = length(unique(experiencia(:,col))) == n;
end

p1 = sum(diferent)/N;


fprintf("Resultado alinea a): %1.4f\n",p1);


% alinea b)
p2 = 1 - p1;

fprintf("Resultado alinea b): %1.4f\n",p2);



% alinea c)


m = [1000,10000];
n = 10:10:100 ;
probabilidades = zeros(size(N));

for j = 1:length(m)
    m1 = m(j);

    for nexp = n
        a = randi([1,m1],nexp,N);
        res = zeros(1,N);
        for i = 1:N
            res(i) = length(unique(a(:,i))) ~= nexp;
        end
        probabilidades(nexp/10) = sum(res)/N ; 
    end
    subplot(3,1,j);
    plot(n, probabilidades);
    title('Alinea b ')
end


% alinea d)

m = [200 500  1000 2000 5000 10000 20000 50000 100000] ;

n = 100 ;
N = 1e5 ;
res = zeros(size(N)) ;
prob = zeros(size(N)) ;

for i = 1:length(m)
    aux = m(i) ;
    a = randi([1,aux],n,N) ;
    for j = 1:N
        res(j) = length(unique(a(:,j))) ~= n ;
    end
    prob(i) = sum(res) /N ;
end
subplot(3,1,3)
plot(m,prob)
title('Alinea c')




