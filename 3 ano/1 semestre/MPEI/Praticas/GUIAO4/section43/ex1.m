
[Set,Nu,users] = ler_dados('u.data') ;
J = calc_distance(Set,Nu) ;
imagesc(J)
tic
SimilarUsers = pares(J,Nu,users,0.4) ;
fprintf("Time: %d\n",toc);
imagesc(J)
colormap('gray')
colorbar()
% Com base na distaˆncia, determina pares com
% distaˆncia inferior a um limiar pre´-definido

    