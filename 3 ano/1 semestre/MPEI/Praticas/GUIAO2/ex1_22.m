sx = [1,2,3,4,5,6] ;

%px = [1/6,1/6,1/6,1/6,1/6,1/6] ;
px = ones(1,6) / 6 ; % a mesma coisa que a linha acima
subplot(1,2,1)
probs = stem(sx,px);

axis([0 7 -0.01 0.2]);



probs2 = px ;
x2 = 1:6 ;

probcumul = cumsum(probs2) ;
subplot(1,2,2)
stairs([0 x2 7], [0 probcumul 1]);

ylim([0 1.1]) 

title('try') ;