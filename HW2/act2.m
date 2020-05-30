clc;
clear;

a = 1;
b = 0;
c = 10e-14;
tol = 10e-12;

discriminant = b^2 - 4*a*c;

if discriminant >= tol
    disp('There are two real roots')
    root1 = (-b - sqrt(discriminant))/(2*a);
    root2 = (-b + sqrt(discriminant))/(2*a);
    roots = [root1 root2];
elseif discriminant < abs(tol)
    disp('There is one real root')
    root1 = -b/(2*a);
    roots = [root1];
else
    disp('There are no real roots')
    roots = [];
end

disp(roots)