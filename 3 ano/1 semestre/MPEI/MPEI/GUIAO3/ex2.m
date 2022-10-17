T = [1/3 1/3 1/3; %A
    1/4 11/20 1/5;%B
    0 1/2 1/2]    %C
Taux = T'
%B)
estado = [2/3 1/6 1/6];


%C)
%aula 30
T30 = T^30;
estado30 = estado*T30

%D)
estadoD = [1/3 1/3 1/3];
estado30D = estadoD*T30