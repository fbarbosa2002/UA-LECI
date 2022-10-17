m = 1000; 
N = 10000;

ns = 10:10:100;

res = zeros(1, length(ns));

for n =ns

    experiencia = randi(m,n,N);

    diferent = zeros(1,N);  

    for col = 1:N
        diferent(col)=length(unique(experiencia(:,col))) == n;
    end

    res() = sum(diferent)/N

end
