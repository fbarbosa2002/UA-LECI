% EXERCÍCIO 1
% A)
exp = 1e5;
experimento1 = randi([1,4],1,exp);
experimento2 = randi([5,8],1,exp);
lancamento = experimento2 - experimento1;
probTotal = zeros(1,7);
for i = 1:7
    disp(i);
    contaux = lancamento == i;
    probTotal(i) = sum(contaux)/exp;
end
teste = sum(probTotal);
stem(1:7,probTotal);

% B)
esperanca = 0;
esperanca2Alt = 0;
for j = 1:7
    esperanca = esperanca + j*probTotal(j);
    esperanca2Alt = esperanca2Alt + j^2*probTotal(j);
end
esperancaAlt = sum((1:7).*probTotal);
esperanca2 = sum((1:7).^2*probTotal');

var = esperanca2 - esperanca^2;
dp = sqrt(var);

%C)
prob2given5aux = 5 - experimento1 == 1;
prob1given5 = sum(prob2given5aux)/exp;

% EXERCÍCIO 3


H = [0   1   0   0   0  ;
     0   0   1/2 1/2 0  ;
     1/5 1/5 1/5 1/5 1/5;
     0   0   0   0   1  ;
     0   0   0   0   0  ]';
p = 0.8;
N = 5;
A = p*H + (1-p)*ones(N)/N;
A(isnan(A))  = 1/N;
x0 = ones(N,1)/N;
for i = 1:10
    xold = x0;
    x = A*x;
end




% EXERCÍCIO 4
CH1= {'Aníbal','Carlota','Eduardo','Francisco','Luis','Mário','Vera'};
CH2= {'Bernardo','Carlota','Daniel','Orlando','Paulo',};

BF = Init(50);
for i = 1:length(CH1)
    aux = cell2mat(CH1(i));
    BF = AddElement(BF, aux, 5);
end

for i = 1:length(CH2)
    aux = cell2mat(CH2(i));
    check = IsMember(BF, aux, 5);
    if check == false
        %fprintf('%s does not belong\n', aux);
    end
end



function BF = AddElement(BF,key,k)
    h = 127;
    chave = double(key);
    n = length(BF);
    for i=1:length(key)
        h = mod(31*h+chave(i), 2^32-1);
    end
    for i= k:-1:1
        h = mod(31*h+i, 2^32-1);
        BF(mod(h,n)+1) = true;
    end
end

function check = IsMember(BF, key, k)
    check = true;
    h = 127;
    chave = double(key);
    n = length(BF);
    for i = 1:length(key)
        h = mod(31*h+chave(i), 2^32-1);
    end
    for i= k:-1:1
        h = mod(31*h+1, 2^32-1);
        if BF(mod(h,n)+1) == false
            check = false;
            break;
        end
    end
    
end







function BF= Init(n)
    BF= zeros(1,n);
end