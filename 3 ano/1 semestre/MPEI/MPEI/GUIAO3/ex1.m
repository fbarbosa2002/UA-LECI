T = [0.2 0.8;
    0.3 0.7];
Taux = [0.7 0.8;
    0.3 0.2];
%0 = nao foi a aula
%1 = foi a aula

T2 = T^2
Taux2 = Taux^2; 
%a)
% Qual a probabilidade de P2 = 2, dado P = 1
display(T2(2,2))
display(Taux2(1,1));

%b)
display(T2(1,2))
display(Taux2(1,2));

%c)
T30 = T^30;
display(T30(1,1));
Taux30 = Taux^30;
display(Taux30(2,2));

%d)
estado = [0.15 0.85];
probs =zeros(1,30);
probs(1) = 0.15;
trans = T;
for i = 2:length(probs)
    trans = trans*T;
    estadoN = estado*trans;
    probs(i) = estadoN(1);
end
plot(1:30, probs);
%d ALT)
estado2 = [0.85, 0.15]';
prob2= zeros(1,30);
prob2(1) = 0.15;
transAux = Taux;
for i = 2:length(prob2)
    transAux =  transAux* Taux;
    estado2N = transAux * estado2;
    prob2(i) = estado2N(2);
end