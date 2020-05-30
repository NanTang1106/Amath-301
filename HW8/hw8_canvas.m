load('Plutonium.mat')

% Problem 7
% find gamma
t = (1970:1:2010).';
dpdt1_m = zeros(length(tdata), 1);
dpdt1_m(1) = (findp(t(1)+1) - findp(t(1))) / 1;
for i = 2:length(t)-1
    dpdt1_m(i) = (findp(t(i+1)) - findp(t(i-1))) / 2;
end
dpdt1_m(length(t)) = (findp(t(length(t))) - findp(t(length(t))-1)) / 1;
pdecay_rt = -findp(t).^(-1) .* dpdt1_m;
gamma = mean(pdecay_rt);

% theoretical form of P
t_cont = (1970:0.1:2010).';
Pt = @(t) 1000.*exp(-gamma.*(t-1970));
p_estimate = Pt(tdata);
errors = p_estimate - Pdata;

set(gcf, 'position', [100 100 600 400], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
box on
plot(t_cont, Pt(t_cont), '-k', 'Linewidth', 1)
plot(tdata, Pdata, 'r.', 'Markersize', 15)
title('Radioactive Decay of Plutonium')
%xlabel('Year Since 1970')
ylabel('Mass of Plutonium')
legend('Exponential Decay','Data','Location','best')
hold off

subplot(2,1,2); 
hold on
box on
plot(tdata, errors, '-k', 'Marker', '.', 'MarkerFaceColor', 'r', ...
    'MarkerEdgeColor', 'r', 'Markersize', 15)
yline(0, '--b');
xlabel('Year Since 1970')
ylabel('Error')
hold off

print(gcf, '-dpng', 'plutonium_decay.png')

% Problem 12
% Get 4 quandrature schemes
mu = 1;
sigmasq = 4;
a = 2;
b = 4;
px = @(x) exp((-(x-mu).^2) ./ (2*sigmasq));

areas_l = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    area = sum(px(a:j:b-j))*j;
    areas_l(count) = area;
    count = count + 1;
end

areas_r = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    area = sum(px(a+j:j:b))*j;
    areas_r(count) = area;
    count = count + 1;
end

areas_tri = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    x = a:j:b;
    p = px(x);
    area = trapz(x, p);
    areas_tri(count) = area;
    count = count + 1;
end

areas_simpson = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    area = j/3*(px(a) + 4*sum(px(a+j:2*j:b-j)) + 2*sum(px(a+2*j:2*j:b-2*j)) + px(b));
    areas_simpson(count) = area;
    count = count + 1;
end

truesol = integral(px, a, b);

step_size = 2.^(0:-1:-16).';

error_l = abs(truesol - areas_l);
error_r = abs(truesol - areas_r);
error_tri =  abs(truesol - areas_tri);
error_simpson = abs(truesol - areas_simpson);

clf
set(gcf, 'position', [100 100 800 500], 'paperpositionmode', 'auto')
loglog(step_size, error_l, 'r.', 'Markersize', 7), hold on
loglog(step_size, error_r, 'go', 'Markersize', 7)
loglog(step_size, error_tri, 'bx', 'Markersize', 7)
loglog(step_size, error_simpson, 'm*', 'Markersize', 7)
loglog(2.^(0:-1:-17), 0.8 * 2.^(0:-1:-17), 'k-','Linewidth',2)
loglog(2.^(0:-1:-17), 0.005 * (2.^(0:-1:-17)).^2, 'k--','Linewidth',2)
loglog(2.^(0:-1:-17), 0.002 * (2.^(0:-1:-17)).^4, 'k-.','Linewidth',2)
yline(10^(-16), 'r:','Linewidth',2);
xlim([2^(-17), 1])
ylim([10^-18, 1])
xlabel('Grid Spacing \Deltax')
ylabel('Error')
title('Convergence of Quadrature Schemes')
legend('Error of Left-Rectangle', 'Error of Right-Rectangle', 'Error of Trapezoid',...
    'Error of Simpsons', 'O(h)', 'O(h^2)', 'O(h^4)','Machine Precision','Location', 'SouthEast')

print(gcf, '-dpng', 'quadrature_errors.png')


