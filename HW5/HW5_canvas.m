load('CO2_data.mat');
y_20 = y(1:240);
t_20 = t(1:240);
t_65 = 0:1/12:65;

%Problem 2
coeffs_fitlinear = polyfit(t, y, 1);
A = coeffs_fitlinear(1);
B = coeffs_fitlinear(2);
y_fit_linear = @(t) A*t + B;

y_fitlinear = y_fit_linear([0:1/12:65]);

clf
set(gcf, 'position', [20 50 600 400], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
box on
plot(t, y, 'LineStyle','-','Color','k','Marker','.')
plot(0:1/12:65, y_fitlinear, 'LineStyle','-','Color',[1 .5 0],'LineWidth',2)
axis([0 65 300 max(max(y_fitlinear), max(y))])
title('Linear Fit')
ylabel('Atmospheric CO_2')
xlabel('Year Since 1958')
legend('Data','Fit Curve','Location','northwest')
hold off

y_fitlinear_20 = y_fit_linear(t_20);
fit_error_20 = y_fitlinear_20 - y_20;
subplot(2,1,2); 
hold on
box on
plot([0 240], zeros(2), 'LineStyle','-','Color',[1 .5 0],'LineWidth',2)
plot(t_20, fit_error_20, 'LineStyle','-','Color','k','Marker','.')
axis([0 20 min(fit_error_20) 10])
title('Error in Data Fit')
ylabel('Fit Error')
xlabel('Year Since 1958')
hold off

print(gcf, '-dpng', 'co2_fit_linear.png')

%Problem 4
coeffs_fitquadratic = polyfit(t, y, 2);
A2 = coeffs_fitquadratic(1);
B2 = coeffs_fitquadratic(2);
C2 = coeffs_fitquadratic(3);
y_fit_quadratic = @(t) A2*(t.^2) + B2*t + C2;

y_fitquadratic_65 = y_fit_quadratic(t_65);

clf
set(gcf, 'position', [20 50 600 400], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
box on
plot(t, y, 'LineStyle','-','Color','k','Marker','.')
plot(t_65, y_fitquadratic_65, 'LineStyle','-','Color',[0 .5 1],'LineWidth',2)
axis([0 65 300 max(max(y), max(y_fitquadratic_65))])
title('Quadratic Fit')
ylabel('Atmospheric CO_2')
xlabel('Year Since 1958')
legend('Data','Fit Curve','Location','northwest')
hold off

y_fitquadratic_20 = y_fit_quadratic(t_20);
fit_error2_20 = y_fitquadratic_20 - y_20;
subplot(2,1,2); 
hold on
box on
plot([0 240], zeros(2), 'LineStyle','-','Color',[0 .5 1],'LineWidth',2)
plot(t_20, fit_error2_20, 'LineStyle','-','Color','k','Marker','.')
axis([0 20 -5 5])
title('Seasonal Variation')
ylabel('Variation Around Mean')
xlabel('Year Since 1958')
hold off

print(gcf, '-dpng', 'co2_fit_quad.png')

%Problem 6
M_fitquadsinu = [sum(t.^4) sum(t.^3) sum(t.^2) sum(sin(2*pi.*t).*t.^2) 
    sum(t.^3) sum(t.^2) sum(t) sum(sin(2*pi.*t).*t)
    sum(t.^2) sum(t) n sum(sin(2*pi.*t))
    sum(t.^2.*sin(2*pi.*t)) sum(t.*sin(2*pi.*t)) sum(sin(2*pi.*t)) sum(sin(2*pi.*t).^2)];

b_fitquadsinu = [sum(y.*t.^2); sum(y.*t); sum(y); sum(y.*sin(2*pi.*t))];

coeffs_fitquadsinu = M_fitquadsinu\b_fitquadsinu;
A3 = coeffs_fitquadsinu(1);
B3 = coeffs_fitquadsinu(2);
C3 = coeffs_fitquadsinu(3);
D3 = coeffs_fitquadsinu(4);
y_fit_quadsinu = @(t) A3*(t.^2) + B3.*t + C3 + D3*sin(2*pi.*t);

y_fitquadsinu_65 = y_fit_quadsinu(t_65);

clf
set(gcf, 'position', [20 50 600 400], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
box on
plot(t, y, 'LineStyle','-','Color','k','Marker','.')
plot(t_65, y_fitquadsinu_65, 'LineStyle','-','Color',[0 .8 0],'LineWidth',2)
axis([0 65 300 max(max(y), max(y_fitquadsinu_65))])
title('Quadratic + Sinusoidal Fit')
ylabel('Atmospheric CO_2')
xlabel('Year Since 1958')
legend('Data','Fit Curve','Location','northwest')
hold off

y_fitquadsinu_20 = y_fit_quadsinu(t_20);
fit_error3_20 = y_fitquadsinu_20 - y_20;
subplot(2,1,2); 
hold on
box on
plot([0 240], zeros(2), 'LineStyle','-','Color',[0 .8 0],'LineWidth',2)
plot(t_20, fit_error3_20, 'LineStyle','-','Color','k','Marker','.')
axis([0 20 -5 5])
title('Error in Data Fit')
ylabel('Error in Fit')
xlabel('Year Since 1958')
hold off

print(gcf, '-dpng', 'co2_fit_quadsinu.png')

%Problem 8
A = 0.03;
B = -100;
C = 300;
coeff_exp = fminsearch('cal_error',[A B C],[],t,y);

A = coeff_exp(1);
B = coeff_exp(2);
C = coeff_exp(3);
y_fit_exp = @(t) exp(A.*(t-B)) + C;

y_fitexp_65 = y_fit_exp(t_65);
clf
set(gcf, 'position', [20 50 600 400], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
box on
plot(t, y, 'LineStyle','-','Color','k','Marker','.')
plot(t_65, y_fitexp_65, 'LineStyle','-','Color',[0.75 0 1],'LineWidth',2)
axis([0 65 300 max(max(y), max(y_fitexp_65))])
title('Exponential Fit')
ylabel('Atmospheric CO_2')
xlabel('Year Since 1958')
legend('Data','Fit Curve','Location','northwest')
hold off

y_fitexp_20 = y_fit_exp(t_20);
fit_error4_20 = y_fitexp_20 - y_20;
subplot(2,1,2); 
hold on
box on
plot([0 240], zeros(2), 'LineStyle','-','Color',[0.75 0 1],'LineWidth',2)
plot(t_20, fit_error4_20, 'LineStyle','-','Color','k','Marker','.')
axis([0 20 -5 5])
title('Seasonal Variation')
ylabel('Variation Around Mean')
xlabel('Year Since 1958')
hold off

print(gcf, '-dpng', 'co2_fit_exp.png')

%Problem 10
A = 0.03;
B = -100;
C = 300;
D = 3;
E = 2*pi;
F = 0;
options = optimset('MaxFunEvals', 10000, 'MaxIter', 10000);
coeff_expsinu = fminsearch('cal_error2',[A B C D E F], options);

A = coeff_expsinu(1);
B = coeff_expsinu(2);
C = coeff_expsinu(3);
D = coeff_expsinu(4);
E = coeff_expsinu(5);
F = coeff_expsinu(6);
y_fit_expsinu = @(t) exp(A.*(t-B)) + C + D.*sin(E.*(t-F));

y_fitexpsinu_65 = y_fit_expsinu(t_65);
clf
set(gcf, 'position', [20 50 600 400], 'paperpositionmode', 'auto')
subplot(2,1,1);
hold on
box on
plot(t, y, 'LineStyle','-','Color','k','Marker','.')
plot(t_65, y_fitexpsinu_65, 'LineStyle','-','Color',[1 0 .25],'LineWidth',2)
axis([0 65 300 max(max(y), max(y_fitexpsinu_65))])
title('Exponential + Sinusoidal Fit')
ylabel('Atmospheric CO_2')
xlabel('Year Since 1958')
legend('Data','Fit Curve','Location','northwest')
hold off

y_fitexpsinu_20 = y_fit_expsinu(t_20);
fit_error5_20 = y_fitexpsinu_20 - y_20;
subplot(2,1,2); 
hold on
box on
plot([0 240], zeros(2), 'LineStyle','-','Color',[1 0 .25],'LineWidth',2)
plot(t_20, fit_error5_20, 'LineStyle','-','Color','k','Marker','.')
axis([0 20 -5 5])
title('Error in Data Fit')
ylabel('Error in Fit')
xlabel('Year Since 1958')
hold off

print(gcf, '-dpng', 'co2_fit_expsinu.png')





