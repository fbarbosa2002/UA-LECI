p = 0.5;
k = 6;
n = 15;
prob = nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k) = n!/(n-k)!/k!