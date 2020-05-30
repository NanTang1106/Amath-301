x = [0 0.5 1.1 1.7 2.1 2.5 2.9 3.3 3.7 4.2 4.9 5.3 6 6.7 7];
y = [1.1 1.6 2.4 3.8 4.3 4.7 4.8 5.5 6.1 6.3 7.1 7.1 8.2 6.9 5.3];

coefdegreen = polyfit(x, y, 14);
xp = 0:0.1:7;
ypn = polyval(coefdegreen, xp);

coefdegree1 = polyfit(x, y, 1);
yp1 = polyval(coefdegree1, xp);

hold on
plot(x, y, 'o')
plot(xp, yp1)
plot(xp, ypn)

coefdegreen = polyfit(x, y, 14);
ypn = polyval(coefdegreen, x);

coefdegree1 = polyfit(x, y, 1);
yp1 = polyval(coefdegree1, x);

n = length(x);
en = sqrt(sum(abs(ypn-y).^2)/n);
e1 = sqrt(sum(abs(yp1-y).^2)/n);

yinterp = interp1(x, y, xp);
plot(xp, yinterp,'b')

yinterpSp = interp1(x, y, xp,'spline', 'g');
plot(xp, yinterpSp)


%curve fitting
x2 = [-3 -2.2 -1.7 -1.5 -1.3 -1 -0.7 -0.4 -0.25 -0.05 0.07 0.15 0.3 0.65 1.1 1.25 1.8 2.5];
y2 = [-.2 0.1 0.05 0.2 0.4 1 1.2 1.4 1.8 2.2 2.1 1.6 1.5 1.1 0.8 0.3 -0.1 0.2];

A = 1;
B = 1;

coeff = fminsearch('gauss_fit',[A B],[],x2,y2);
A = coeff(1);
B = coeff(2);

f = @(x,y) x.^2 + 3*y.^2 + 1;
XY = fminsearch(@(XY) f(XY(1),XY(2)), [2 1]);
x = XY(1);
y = XY(2);





