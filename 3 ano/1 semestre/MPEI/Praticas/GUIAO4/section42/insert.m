function BF = insert(elem,BF,k)
    n = length(BF) ;
    for i = 1:k
        elem = [elem num2str(i)] ;
        h = DJB31MA(elem, 127) ;
        h = mod(h,n) + 1;
        BF(h) = true ;
    end
end