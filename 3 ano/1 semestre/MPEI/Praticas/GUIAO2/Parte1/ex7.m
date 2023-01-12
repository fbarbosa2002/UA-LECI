% exercicio 7 -> parte 2.1
% P (A|B) = P(A e B) / P(B)
% Probabilidade do
%   a -> programa ser do carlos
%   b -> programa conter um erro

ntentativas = 1e5;

progA = rand(20, ntentativas) < 0.01 ;
progB = rand(30, ntentativas) < 0.05 ;
progC = rand(50, ntentativas) < 0.001 ;

experiencia = [progA ; progB ; progC] ;

contAB = 0;
contB = 0;

for i = 1:ntentativas
    aux = randi(100) ;

    if experiencia(aux,i)==true
        contB = contB + 1;  % probabilidade do programa conter um erro
        if aux > 50
            contAB = contAB + 1; % conter um erro e ser do  Carlos
        end
    end
end
P_Carlos_erro_sim = contAB/contB ;
fprintf("Resultado alinea a ->\n\tProbabilidade do programa ser do Carlos sabendo que contem um erro: %1.4f\n",P_Carlos_erro_sim)

contA = 0;
contB = 0;
contC = 0;
contfinal = 0 ;
for i = 1:ntentativas
    aux = randi(100) ;

    if experiencia(aux,i)==true
        if aux <= 20
            contA = contA + 1; % conter um erro e ser do Andre
        elseif aux > 20 && aux<=30
            contB = contB + 1; % conter um erro e ser do Bruno
        else
            contC = contC + 1; % conter um erro e ser do Carlos
        end
    end
end

fprintf("Resultado alinea b ->\n\t")

if contA > contB && contA > contC
    fprintf("É mais provavel ser do Andre\n")
elseif contB > contA && contB > contC
    fprintf("É mais provavel ser do Bruno\n")
elseif contC > contA && contC > contB
    fprintf("É mais provavel ser do Carlos\n")
end

    
