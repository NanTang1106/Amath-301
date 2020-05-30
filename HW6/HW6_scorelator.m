%Problem 1
y0 = 0;
theta_opt = fminbnd('ximpact', 0, pi/2,[], y0);
save('A1.dat','theta_opt','-ascii')

distance = abs(ximpact(theta_opt, y0));
save('A2.dat','distance','-ascii')

%Problem 2
y0 = 10;
theta_opt2 = fminbnd('ximpact', 0, pi/2, [], y0);
save('A3.dat','theta_opt2','-ascii')

distance2 = abs(ximpact(theta_opt2, y0));
save('A4.dat','distance2','-ascii')

%Problem 3
N = 30;
temp1 = diag(diag(repmat(-2,N))); 
temp2 = diag(diag(ones(N-1)), -1);
temp3 = diag(diag(ones(N-1)), 1);
A = temp1 + temp2 + temp3;

D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

omega_opt = fminbnd('geteigen', 1, 1.9,[], D, L, U);
save('A5.dat','omega_opt','-ascii')

eigmax_opt = geteigen(omega_opt, D, L, U);
save('A6.dat','eigmax_opt','-ascii')








