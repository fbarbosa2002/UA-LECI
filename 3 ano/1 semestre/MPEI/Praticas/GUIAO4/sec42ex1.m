file = fopen("wordlist-preao-20201103.txt","r") ;

file_print = textscan(file,"%s") ;

file_test = file_print{1,1} ;

%disp(file_print{1,1})
%for i = 1:3
%    disp(file_print{i})
%end
fclose(file) ;

n = 1000 ;
k = 3 ;

BF = init(n) ;

%disp(BF) ;
counter = 0 ;
for i = 1: n
 
    BF = insert(file_test{i},BF,k) ;
    disp(BF) ;
    BF = verify(file_test{i},BF,k) ;
    if BF
        counter = counter + 1 ;
    end
    disp(BF) ;
end

fprintf("Falsos negativos = %d\n",counter) ;

function BoomFilter = init(n)
    BoomFilter = zeros(n,1) ;
end

function BoomFilter = insert(elem,BoomFilter,k)
    length_BoomFilter = length(BoomFilter) ;
    for i = 1:k
        elem = [ elem num2str(i)] ;
        h = DJB31MA(elem,127) ;
        mod_value = mod(h,length_BoomFilter) + 1;
        BoomFilter(mod_value) = true ;
    end
end

function BoomFilter = verify(elem,BoomFilter,k)
    BoomFilter = true ;
    length_BoomFilter = length(BoomFilter) ;
    for i = 1:k
        elem = [ elem num2str(i)] ;
        h = DJB31MA(elem,127) ;

        mod_h = mod(h,length_BoomFilter) + 1 ; 

        if ~BoomFilter(mod_h)
            BoomFilter = false ;
            break ;
        end
    end
end