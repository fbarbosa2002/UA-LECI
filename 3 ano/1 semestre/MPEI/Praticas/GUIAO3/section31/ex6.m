%alinea a)

fprintf("Alinea a):\n Matriz: ")
T=[0.8 0   0.3 0 0;
   0.2 0.6 0.2 0 0;
   0   0.1 0.4 0 0;
   0   0.3 0   1 0;
   0   0   0.1 0 1]

%alinea b)
fprintf("Alinea b): Grafico")
v = [1 0 0 0 0]';
prob2 = zeros(1,100);
for n = 1:100
    v = T * v;
    prob2(n) =  v(2);
end
plot(prob2)

% alinea d)
fprintf("\nAlinea d):")
num_est_trasientes=3;
Q = T(1:num_est_trasientes,1:num_est_trasientes)

% alinea e)

fprintf("\nAlinea e):")
F = inv(eye(3)-Q)

% alinea f)

media = sum(F);
fprintf("Alinea f):\nMedia: %f\n",media)
% alinea g)
fprintf("Alinea g):")
B = T(4:end,1:3) * F