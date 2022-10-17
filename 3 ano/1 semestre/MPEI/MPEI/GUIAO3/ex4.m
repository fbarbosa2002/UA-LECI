%A)
p = 0.4;
q = 0.6;

T = [p^2 (1-p)^2 p*(1-p) p*(1-p); %A
      0    0        0       1;    %B
      0    0        0       1;    %C
      q^2 q*(1-q) q*(1-q) (1-q)^2];%D

%B)
est = 1; %inicialmente esta no estado A
N = [5 10 100 200];
probEstados = zeros(length(N), length(T(1,:)));

for i = 1:length(N)
    n = N(i);
    Tn = T^n;
    probEstados(i,:) = Tn(1,:);
end
display(probEstados);

%C)
Taux = T';
M = [Taux-eye(4); ones(1,4)]
x = [0;0;0;0;1];
u = M\x;
display(u);