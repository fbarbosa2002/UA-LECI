%
H=[0 0   0 0   1/3 0
   1 0   0 0   1/3 0
   0 1/2 0 1   0   0
   0 0   1 0   0   0
   0 1/2 0 0   0   0
   0 0   0 0   1/3 0]

pr = ones(6)/6;
for i = 1:1000
    pr = H * pr;
end

pr
H2 = H
H2(:,6) = 1/6;
pr2 = ones(6)/6;
for i = 1:10
    pr2 = H2 *pr2; 
end

pr2

beta = 0.8
A = beta * H2 + (1-beta) *ones(6)/6

pr3= ones(6,1)/6; 
iter = 0;
epsilon = 1*exp(-3);
x=ones(6,1)/6;
x0=ones(6,1)/6;

pr3


% (e)
N = 6;

x0 = ones(N,1)/N;
iter = 1;
x= x0;
epsilon = 1e-3;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold = x;
    x = A *x;
    if max(abs(x -xold))<epsilon 
        break; 
    end
iter = iter +1;
end

