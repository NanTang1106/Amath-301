clc
clear
load('CO2_data.mat');

%Problem 1
M_fitlinear = [sum(t.^2) sum(t)
    sum(t) n];
save('A1.dat','M_fitlinear','-ascii')

b_fitlinear = [sum(t.*y); sum(y)];
save('A2.dat','b_fitlinear','-ascii')

coeffs_fitlinear = M_fitlinear\b_fitlinear;
save('A3.dat','coeffs_fitlinear','-ascii')

%Problem 3
M_fitquadratic = [sum(t.^4) sum(t.^3) sum(t.^2)
    sum(t.^3) sum(t.^2) sum(t)
    sum(t.^2) sum(t) n];
save('A4.dat','M_fitquadratic','-ascii')

b_fitquadratic = [sum(y.*t.^2); sum(y.*t); sum(y)];
save('A5.dat','b_fitquadratic','-ascii')

coeffs_fitquadratic = M_fitquadratic\b_fitquadratic;
save('A6.dat','coeffs_fitquadratic','-ascii')

%Problem 5
M_fitquadsinu = [sum(t.^4) sum(t.^3) sum(t.^2) sum(sin(2*pi.*t).*t.^2) 
    sum(t.^3) sum(t.^2) sum(t) sum(sin(2*pi.*t).*t)
    sum(t.^2) sum(t) n sum(sin(2*pi.*t))
    sum(t.^2.*sin(2*pi.*t)) sum(t.*sin(2*pi.*t)) sum(sin(2*pi.*t)) sum(sin(2*pi.*t).^2)];
save('A7.dat','M_fitquadsinu','-ascii')

b_fitquadsinu = [sum(y.*t.^2); sum(y.*t); sum(y); sum(y.*sin(2*pi.*t))];
save('A8.dat','b_fitquadsinu','-ascii')

coeffs_fitquadsinu = M_fitquadsinu\b_fitquadsinu;
save('A9.dat','coeffs_fitquadsinu','-ascii')

%Problem 7
A = 0.03;
B = -100;
C = 300;
coeff_exp = fminsearch('cal_error',[A B C],[],t,y);

coeff_exp = coeff_exp';
save('A10.dat','coeff_exp','-ascii')

ts = [-58; 0; 62];
A = coeff_exp(1);
B = coeff_exp(2);
C = coeff_exp(3);
y_fit_exp = @(t) exp(A.*(t-B)) + C;
y_fitexp = y_fit_exp(ts);
save('A11.dat','y_fitexp','-ascii')

%Problem 9
A = 0.03;
B = -100;
C = 300;
D = 3;
E = 2*pi;
F = 0;
options = optimset('MaxFunEvals', 10000, 'MaxIter', 10000);
coeff_expsinu = fminsearch('cal_error2',[A B C D E F],options);

coeff_expsinu = coeff_expsinu';
save('A12.dat','coeff_expsinu','-ascii')

t_2020 = 2020-1958 + (0:11).'/12;
A = coeff_expsinu(1);
B = coeff_expsinu(2);
C = coeff_expsinu(3);
D = coeff_expsinu(4);
E = coeff_expsinu(5);
F = coeff_expsinu(6);
y_fit_expsinu = @(t) exp(A.*(t-B)) + C + D.*sin(E.*(t-F));
y_fitexpsinu = y_fit_expsinu(t_2020);
save('A13.dat','y_fitexpsinu','-ascii')



  