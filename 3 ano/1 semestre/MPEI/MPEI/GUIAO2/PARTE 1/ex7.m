%Teorema de Bayes
%p(A|B) = p(B|A)*p(A)/p(B)
%p(E) = probabilidade de ocorrer um erro
%p(A) = 0.2
%p(B) = 0.3
%p(C) = 0.5
%p(E|C) = probabilidade do erro ser de carlos = 0.001
%p(E|B) = probabilidade do erro ser de bruno = 0.05
%p(E|A) = probabilidade do erro ser de andre = 0.01
%p(C|E) = ?
pA = 0.2;
pB = 0.3;
pC = 0.5;
pE_dado_A = 0.01;
pE_dado_B = 0.05;
pE_dado_C = 0.001;

pE = pE_dado_A *pA + pE_dado_B *pB + pE_dado_C * pC;
pC_dado_E = pE_dado_C * pC/pE;
pB_dado_E = pE_dado_B * pB/pE;
pA_dado_E = pE_dado_A * pA/pE;