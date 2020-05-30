function [eigMax] = getEigMax(M)

D = eig(M);
eigMax = max(abs(D));