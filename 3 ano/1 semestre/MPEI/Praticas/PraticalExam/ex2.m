






frases = {'Os animais sao nossos amigos.','Os meus primos sao muito amigos','Os animais dos meus primos sao muito amigos.','Os meus primtos teem muitos animais'};
shingle_size=3;
K = 5;  % Número de funções de dispersão
    
MinHashSig = inf(4,42) ;
for i = 1:length(frases)
    conjunto = lower(frases{i});
    shingles = {};
    for j= 1 : length(conjunto) - shingle_size+1  % Criacao dos shingles para cada filme
        shingle = conjunto(j:j+shingle_size-1);
        shingles{j} = shingle ;
        hashcodes(j) = hf1(shingle,K) ;
    end
   
   
    disp(hashcodes(i))
    
    MinHashSig(i,:) = min([MinHashSig(i,:);hashcodes]);  % Valor minimo da hash para este shingle


end
K = size(MinHashSig,1);
 % calcular a Distância de Jaccard
    distJ = ones(1, 4) ;
    h = waitbar(0,'Calculating');
    for i=1:4
        waitbar(i/K, h);
        distJ(i) = sum(MinHashSig(i,:) ~= MinHashSig(1,:))/K;
    end
    distJ
    delete(h);
    
function hashCode = hf1(shingle,nhf)
% USAGE EXAMPLE: hc=hf1('abcd',3)
% input : shingle  - string (of length 3)
%         nhf      - number of the hash function to apply (1 to 5)
% output: hashCode - from 0 to 1012 (M-1)     

l = 3;  % shingle length, don't change
n = 5;  % max number of hash function

M = 1013; % to limit hashcode to M-1

if length(shingle) ~= l
    fprintf(1,'ERROR! 1st parameter must have %d characters\n',l);
    
    hashCode = -1;
    return 
end

if nhf <1 || nhf > n
    fprintf(1,'ERROR! hf number must be between 1 and %d\n',n);
    hashCode = -1;
    return
end

R =[15761,14189,65576,75776;
    97062,42177, 3571,74315;
    95719,91576,84915,39223;
    48539,79223,93402,65549;
    80030,95952,67875,17119];

R=R(:,1:l);
 
% each line of R defines a different hash function
r=R(nhf,:);

%   (\sum r * x ) mode M
hashCode=mod(sum (r.*  double(shingle)),M);

end