% exercicio 4 // parte 3.1
% alinea a)
p = 0.4 ;
q = 0.6 ;

T = [ p^2 0 0 q^2 ; (1-p)^2 0 0 q*(1-q); p*(1-p) 0 0 q*(1-q); p*(1-p) 1 1 (1-q)^2];
fprintf("Alinea a) -> Matriz:\n")
disp(T)
% alinea b)
fprintf("Alinea b): \n")
T5 = T^5;
T5_resp = T5(:,1);

fprintf("Probabilidade em 5 transicoes de estar no estado A: %1.4f\n",T5_resp(1))
fprintf("Probabilidade em 5 transicoes de estar no estado B: %1.4f\n",T5_resp(2))
fprintf("Probabilidade em 5 transicoes de estar no estado C: %1.4f\n",T5_resp(3))
fprintf("Probabilidade em 5 transicoes de estar no estado D: %1.4f\n\n",T5_resp(4))

T10 = T^10;
T10_resp = T10(:,1);

fprintf("Probabilidade em 10 transicoes de estar no estado A: %1.4f\n",T10_resp(1))
fprintf("Probabilidade em 10 transicoes de estar no estado B: %1.4f\n",T10_resp(2))
fprintf("Probabilidade em 10 transicoes de estar no estado C: %1.4f\n",T10_resp(3))
fprintf("Probabilidade em 10 transicoes de estar no estado D: %1.4f\n\n",T10_resp(4))

T100 = T^100;
T100_resp = T100(:,1);

fprintf("Probabilidade em 100 transicoes de estar no estado A: %1.4f\n",T100_resp(1))
fprintf("Probabilidade em 100 transicoes de estar no estado B: %1.4f\n",T100_resp(2))
fprintf("Probabilidade em 100 transicoes de estar no estado C: %1.4f\n",T100_resp(3))
fprintf("Probabilidade em 100 transicoes de estar no estado D: %1.4f\n\n",T100_resp(4))

T200 = T^200;
T200_resp = T200(:,1);

fprintf("Probabilidade em 200 transicoes de estar no estado A: %1.4f\n",T200_resp(1))
fprintf("Probabilidade em 200 transicoes de estar no estado B: %1.4f\n",T200_resp(2))
fprintf("Probabilidade em 200 transicoes de estar no estado C: %1.4f\n",T200_resp(3))
fprintf("Probabilidade em 200 transicoes de estar no estado D: %1.4f\n",T200_resp(4))

% alinea c
lista_estados = ["A"  "B" "C"  "D"];
fprintf("Alinea c): \n")

I = eye(4);
I = I - T;
M = [T - eye(4); ones(1,4)];

col_zeros  = [0;0;0;0;1];
u = M\col_zeros;
fprintf("Matriz simplficada para todos os estados: \n")
disp(u)
for i = 1:4    
    T200 = T^200;
    T200_resp = T200(:,i);
    fprintf("No estado %s: \n",lista_estados(i))
    for j = 1:4
        fprintf("Probabilidade limite do estado %s: %1.4f\n",lista_estados(j),T200_resp(j))
    end
    fprintf("\n")
end

