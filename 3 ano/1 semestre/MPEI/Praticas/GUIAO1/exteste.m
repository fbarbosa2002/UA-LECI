N=10e6;
n=20;
p=0.5;

for k = 0:n
    p2(k+1)=prob(k,n,p,N);
end

stem(0:n,p2)
