function eigmax = geteigen(omega, D, L, U)

M = @(omega) -((D + omega*L)^(-1))*(omega*U + (omega-1)*D);

eigvalues = eig(M(omega));

eigmax = max(abs(eigvalues));