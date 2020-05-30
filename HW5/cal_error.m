function e = cal_error(init, t, y)
A = init(1);
B = init(2);
C = init(3);

e = 0.5 * sum((exp(A.*(t - B)) + C - y).^2);