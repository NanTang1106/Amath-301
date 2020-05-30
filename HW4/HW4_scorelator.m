%Problem 1
N = 30;
size = 400;

temp1 = diag(diag(repmat(-2,N))); 
temp2 = diag(diag(ones(N-1)), -1);
temp3 = diag(diag(ones(N-1)), 1);

A = temp1 + temp2 + temp3;
save('A1.dat','A','-ascii')
   
tk = linspace(0, pi, N);
b = cos(5*tk) + 1/2 * sin(7*tk);
b = reshape(b,[N,1]);
save('A2.dat','b','-ascii')

truesol = A\b;
save('A3.dat','truesol','-ascii')

%Problem 2
D = diag(diag(A));
T = A - D;

M = -D^(-1)*T;
g = D^(-1)*b;

[Jacobisol, error] = MyIteration(M, g, truesol, size, N);

save('A4.dat','Jacobisol','-ascii')

colError = error';
save('A5.dat','colError','-ascii')

%Problem 3
eigMax = getEigMax(M);
save('A6.dat','eigMax','-ascii')

%Problem 6
S = tril(A);
T2 = A - S;

M2 = -S^(-1)*T2;
g2 = S^(-1)*b;

[GSsol, error2] = MyIteration(M2, g2, truesol, size, N);

save('A7.dat','GSsol','-ascii')

colError2 = error2';
save('A8.dat','colError2','-ascii')

eigMax2 = getEigMax(M2);
save('A9.dat','eigMax2','-ascii')

%Problem 9
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
omega = 1.5;

M3 = -((D + omega*L)^(-1))*(omega*U + (omega-1)*D);
g3 = ((D + omega*L)^(-1))*(omega*b);

[SORsol, error3] = MyIteration(M3, g3, truesol, size, N);

save('A10.dat','SORsol','-ascii')

colError3 = error3';
save('A11.dat','colError3','-ascii')

eigMax3 = getEigMax(M3);
save('A12.dat','eigMax3','-ascii')

%Problem 12
eigValue4 = [];
count = 0;
for i = 1:0.01:1.9
    count = count + 1;
    Mtemp = -((D + i*L)^(-1))*(i*U + (i-1)*D);
    eigValue4(count) = getEigMax(Mtemp);
end

save('A13.dat','eigValue4','-ascii')

%Problem 14
[val, idx] = min(eigValue4);
omegaBest = 1 + 0.01*(idx - 1);

M5 = -((D + omegaBest*L)^(-1))*(omegaBest*U + (omegaBest-1)*D);
g5 = ((D + omegaBest*L)^(-1))*(omegaBest*b);

[SORsol5, error5] = MyIteration(M5, g5, truesol, size, N);

save('A14.dat','SORsol5','-ascii')

colError5 = error5';
save('A15.dat','colError5','-ascii')

eigMax5 = getEigMax(M5);
save('A16.dat','eigMax5','-ascii')


