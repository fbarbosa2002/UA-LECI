% 1a
% p = 0.5;
% prob = 0;
%
%for k = 1:2
%   prob = prob + p^k;
%end
% 
% 
% 
% 1e
n=4;
k=1;
p=0.5;
prob = nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k) = n!/(n-k)!/k!
%
%
% 1f
%n=4;
%p=0.5;
%probTotal = 0;
%for k = 1:4
%   prob = nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k) = n!/(n-k)!/k!
%    probTotal = probTotal + prob;
%end

%1a feita de outra maneira
exp = 1e5;
a = randi([1,2],2,exp);

res = a(1,:) == 1 | a(2,:) == 1;
result = sum(res)/exp;

%1e) de outra maneira
exp = 1e5;
experiencias = rand(4,exp);
lancamentos = experiencias > 0.5;
resultados = sum(lancamentos);
sucessos = resultados == 1;
probAlt = sum(sucessos)/exp;


 

