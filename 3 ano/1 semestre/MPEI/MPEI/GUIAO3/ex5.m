%A) 
Taux = [0.7 0.2 0.1;
    0.2 0.3 0.5;
    0.3 0.3 0.4];
T = Taux';

%B) dado dia 1 = sol, qual a prob de dia 2 = sol e dia 3 = sol

probSol = 0.7*0.7;

%C) dado dia 1 = sol, qual a prob de dia 2 = sol ou nuvens e dia 3 = sol ou
%nuvens

probNaoChuva = 0.7*(0.7 + 0.2) + 0.2*(0.2 + 0.3)

%D) dado dia 1 = sol
diasSol = 1;
diasNuvens = 0;
diasChuva = 0;
v = [1;0;0];
for i = 2:31
    v = T*v;
    diasSol = diasSol + v(1);
    diasNuvens = diasNuvens + v(2);
    diasChuva = diasChuva + v(3);
end

display(diasSol);
display(diasNuvens);
display(diasChuva);
display(diasSol + diasNuvens + diasChuva);

%E) dado dia 1 = chuva
diasSol2 = 0;
diasNuvens2 = 0;
diasChuva2 = 1;
v = [0;0;1];
for j = 2:31
    v = T*v;
    diasSol2 = diasSol2 + v(1);
    diasNuvens2 = diasNuvens2 + v(2);
    diasChuva2 = diasChuva2 + v(3);
end

display(diasSol2);
display(diasNuvens2);
display(diasChuva2);
display(diasSol2 + diasNuvens2 + diasChuva2);

%F)
% dado dia 1 = sol
diasDores = 0.1*diasSol + 0.3*diasNuvens + 0.5*diasChuva
display(diasDores)

% dado dia 1 = chuva
diasDores2 = 0.1*diasSol2 + 0.3*diasNuvens2 + 0.5*diasChuva2;
display(diasDores2)



