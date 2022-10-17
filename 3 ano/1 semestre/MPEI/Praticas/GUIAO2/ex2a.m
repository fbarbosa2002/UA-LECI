m = 100 ; 
n = 20 ;
N = 10000;

experiencia = randi(m,n,N);

diferent = zeros(1,N);

for col = 1:N
    diferent(col)=length(unique(experiencia(:,col))) == n;
end

p1 = sum(diferent)/N

p2 = 1 - p1