p = 0.3;
n = 5;
probTotal = 0;

%6a
%k = 3
%prob = nchoosek(n,k)*p^k*(1-p)^(n-k);

%6b
aux = [0:2];
for k = 0:2
    prob = nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k) = n!/(n-k)!/k!
    probTotal = probTotal + prob;
    aux(k+1) = probTotal;
end
hist(aux);