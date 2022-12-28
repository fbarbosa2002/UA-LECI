% alinea a)

% geracao de N palavras aleatoriamente

% input :   N - nr chaves 
%           i_min
%           i_max
%           symbol
%           [p]

N = 10;
i_min = 6;
i_max  = 20;
symbol = ['a':'z'] ;

fprintf("Alinea a):\n")
cell_array_string = generate(N,i_min,i_max,symbol);


% alinea b

probs = load('prob_pt.txt') ;
%disp(probs)

fprintf("\n\nAlinea b): \n")
cell = generate(N,i_min,i_max,symbol,probs) ;





