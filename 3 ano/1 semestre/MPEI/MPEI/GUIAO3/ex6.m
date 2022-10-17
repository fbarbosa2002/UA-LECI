%A)
T = [0.8 0.2 0 0 0;  %1
    0 0.6 0.3 0.1 0; %2
    0 0 1 0 0;       %3
    0.3 0.2 0 0.4 0.1 %4
    0 0 0 0 1]; %5
Taux = T'

%B) e C)
N = 1:100;
probs6b = zeros(1,length(N));
probs6c = zeros(2,length(N));
for n = N
    Tn = T^n;
    probs6b(n) = Tn(1,2);
    probs6c(1,n) = Tn(1,3);
    probs6c(2,n) = Tn(1,5);
end
%B)
plot(N,probs6b);

%C)
% Começa no estado 1 e termina no estado 3
subplot(2,1,1);
plot(N, probs6c(1,:));

%D)
can = Taux([1 2 4 3 5], [1 2 4 3 5])
q = can(1:3, 1:3);

%E)
aux = eye(3) - q
aux2 = inv(aux)


