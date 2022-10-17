% 1 C)
Taux = [0 0.25 0.25 0.25 0.25; % A
        0 0 1/3 1/3 1/3; % B
        0 0 0 0.5 0.5; % C
        0 0 0 0 1; % D
        0 0 0 0 1]; % E
T = Taux';

q = T((1:4), (1:4));

aux = eye(4) - q;
F = inv(aux);

t = F' * ones(4,1);

% 1 D)
Taux2 = [0 0.25 0.25 0.25 0.25; % A
        0 0 1/3 1/3 1/3; % B
        0 0 1 0 0; % C
        0 0 0 0 1; % D
        0 0 0 0 1]; % E

T2 = Taux2';
can = T2([1 2 4 3 5],[1 2 4 3 5]);
q2 = can((1:3), (1:3));
aux2 = eye(3) - q2;
F2 = inv(aux2);
R = can((4:5), (1:3));
B = R*F2;

% 2 B)
Taux3 = [0 0.5 0 0.5 0 0; % C
         0.25 0 0.25 0 0.25 0.25; % A
         0 0.5 0 0.5 0 0; % T
         0.25 0 0.25 0 0.25 0.25; % O
         0 0.25 0.25 0.25 0 0.25; % S
         0 0 0 0 0 1; % FIM
         ];
T3 = Taux3';
can3 = T3((1:5), (1:5));

%2 C)
state = crawl(T3, 1, 6);

%2 D)
costa = [1 4 5 3 2 6];
tosca = [3 4 5 1 2 6];
exp = 1e5;
cont = 0;
for i = 1:exp
    stateAux = crawl(T3, 1, 6);
    if length(stateAux) == 6
        if stateAux == costa
            cont = cont + 1;
        end
    end
end
expCosta = cont/exp;
cont2 = 0;
for i = 1:exp
    stateAux2 = crawl(T3, 3, 6);
    if length(stateAux2) == 6
        if stateAux2 == tosca
            cont2 = cont2 + 1;
        end
    end
end
expTosca = cont2/exp;

% 2 E)
experimento = cell(1,exp);

for i = 1:exp
    initState = randi([1,5]);
    stateAux3 = crawl(T3,initState, 6);
    experimento{i} = stateAux3;
end