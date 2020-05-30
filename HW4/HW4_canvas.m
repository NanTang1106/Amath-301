%Problem 4
%get Jacobi iteration
N = 30;

temp1 = diag(diag(repmat(-2,N))); 
temp2 = diag(diag(ones(N-1)), -1);
temp3 = diag(diag(ones(N-1)), 1);
A = temp1 + temp2 + temp3;

tk = linspace(0, pi, N);
b = cos(5*tk) + 1/2 * sin(7*tk);
b = reshape(b,[N,1]);

truesol = A\b;

D = diag(diag(A));
T = A - D;
M = -D^(-1)*T;
g = D^(-1)*b;

size = 400;

[Jacobisol, error] = MyIteration(M, g, truesol, size, N);

%plot comparison
clf
set(gcf, 'position', [20 50 500 250], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
title('Solution by Jacobi Iteration')
plot(tk,truesol,'LineStyle','-','Color','k','Marker','.')
plot(tk,Jacobisol,'or') 
axis([0 pi min(min(truesol),min(Jacobisol)) max(max(truesol),max(Jacobisol))])
ylabel('Solution')
hold off

diff = abs(truesol - Jacobisol);
subplot(2,1,2); 
hold on 
plot(tk,diff,':or')
axis([0 pi 0 max(diff)])
ylabel('Error')
xlabel('t')
hold off

print(gcf, '-dpng', 'solution_jacobi.png')

%Problem 5 ******
modifyFactor = 2.5;
eigMax = getEigMax(M);
eigTrend = [eigMax eigMax^size];
eigTrendModify = modifyFactor * eigTrend;

clf
set(gcf, 'position', [20 50 500 250],'paperpositionmode', 'auto')
semilogy(error,'.r')
hold on
semilogy([1 size],eigTrendModify,'--k')
legend('Jacobi Error','O(|\lambda_m_a_x|^k)','northeast')
ylabel('Absolute Error (log scale)')
xlabel('Iterations, k')
title('Error of Jacobi Iterates')

print(gcf, '-dpng', 'errors_jacobi.png')

%Problem 7
%get Gauss Seidel iteration.
S = tril(A);
T2 = A - S;

M2 = -S^(-1)*T2;
g2 = S^(-1)*b;

[GSsol, error2] = MyIteration(M2, g2, truesol, size, N);

%plot comparison
clf
set(gcf, 'position', [20 50 500 250], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
title('Solution by Gauss-Seidel Iteration')
plot(tk,truesol,'LineStyle','-','Color','k','Marker','.')
plot(tk,GSsol,'og') 
axis([0 pi min(min(truesol),min(GSsol)) max(max(truesol),max(GSsol))])
ylabel('Solution')
hold off

diff = abs(truesol - GSsol);
subplot(2,1,2); 
hold on 
plot(tk,diff,':og')
axis([0 pi 0 max(diff)])
ylabel('Error')
xlabel('t')
hold off

print(gcf, '-dpng', 'solution_GS.png')

%Problem 8
eigMax2 = getEigMax(M2);
eigTrend2 = [eigMax2 eigMax2^size];
eigTrendModify2 = modifyFactor * eigTrend2;

clf
set(gcf, 'position', [20 50 500 250],'paperpositionmode', 'auto')
semilogy(error2,'.g')
hold on
semilogy([1 size],eigTrendModify2,'--k') 
legend('GS Error','O(|\lambda_m_a_x|^k)','northeast')
ylabel('Absolute Error (log scale)')
xlabel('Iterations, k')
title('Error of GS Iterates')

print(gcf, '-dpng', 'errors_GS.png')

%Problem 10
%get SOR iteration
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
omega = 1.5;

M3 = -((D + omega*L)^(-1))*(omega*U + (omega-1)*D);
g3 = ((D + omega*L)^(-1))*(omega*b);

[SORsol, error3] = MyIteration(M3, g3, truesol, size, N);

%plot comparison
clf
set(gcf, 'position', [20 50 500 250], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
title('Solution by Successive Over-relaxation Iteration (\omega = 1.5)')
plot(tk,truesol,'LineStyle','-','Color','k','Marker','.')
plot(tk,SORsol,'ob') 
axis([0 pi min(min(truesol),min(SORsol)) max(max(truesol),max(SORsol))])
ylabel('Solution')
hold off

diff = abs(truesol - SORsol);
subplot(2,1,2); 
hold on 
plot(tk,diff,':ob')
axis([0 pi 0 max(diff)])
ylabel('Error')
xlabel('t')
hold off

print(gcf, '-dpng', 'solution_SOR.png')

%Problem 11
eigMax3 = getEigMax(M3);
eigTrend3 = [eigMax3 eigMax3^size];
eigTrendModify3 = modifyFactor * eigTrend3;

clf
set(gcf, 'position', [20 50 500 250],'paperpositionmode', 'auto')
semilogy(error3,'.b')
hold on
semilogy([1 size],eigTrendModify3,'--k') 
legend('SOR Error','O(|\lambda_m_a_x|^k)','northeast')
ylabel('Absolute Error (log scale)')
xlabel('Iterations, k')
title('Error of SOR Iterates (\omega = 1.5)')

print(gcf, '-dpng', 'errors_SOR.png')

%Problem 13
eigValue4 = [];
count = 0;
omegaValue = (1:0.01:1.9);
for i = 1:0.01:1.9
    count = count + 1;
    Mtemp = -((D + i*L)^(-1))*(i*U + (i-1)*D);
    eigValue4(count) = getEigMax(Mtemp);
end

clf
set(gcf, 'position', [20 50 500 250],'paperpositionmode', 'auto')
plot(omegaValue, eigValue4, 'Marker','.')
ylabel('|\lambda_m_a_x|')
xlabel('Paremeter \omega')
title('Predicted Decay of SOR Iterates')

print(gcf, '-dpng', 'SOR_rates.png')

%Problem 15
%get SOR iteration when omega is optimal.
[eigMax5, idx] = min(eigValue4);
omegaBest = 1 + 0.01*(idx - 1);

M5 = -((D + omegaBest*L)^(-1))*(omegaBest*U + (omegaBest-1)*D);
g5 = ((D + omegaBest*L)^(-1))*(omegaBest*b);

[SOLsolopt, error5] = MyIteration(M5, g5, truesol, size, N);

eigTrend5 = [eigMax5 eigMax5^size];
eigTrendModify5 = modifyFactor * eigTrend5;

clf
set(gcf, 'position', [20 50 500 250],'paperpositionmode', 'auto')
semilogy(error5,'.m')
hold on
semilogy([1 size],eigTrendModify5,'--k')
legend('SOR Error','O(|\lambda_m_a_x|^k)','northeast')
ylabel('Absolute Error (log scale)')
xlabel('Iterations, k')
title('Error of SOR Iterates (\omega = 1.82)')

print(gcf, '-dpng', 'errors_SOR_optimal.png')
