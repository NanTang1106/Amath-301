function e = cal_error2(init, t, y)
load('CO2_data.mat');

A = init(1);
B = init(2);
C = init(3);
D = init(4);
E = init(5);
F = init(6);

e = 0.5 * sum((exp(A.*(t - B)) + C + D.*sin(E.*(t-F))- y).^2);