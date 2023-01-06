function check_member = verify(elem,BF,k)
    n = length(BF) ;
    check_member = true ;
    for i = 1:k
        
        elem = [elem num2str(i)] ;
        h = DJB31MA(elem,127) ;
        h = mod(h,n) + 1;
        
        if ~BF(h)
            check_member = false ;
            break;
        end
    end
end