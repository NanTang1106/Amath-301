%problem 1
f1 = @(x) x.*exp(x) - 5;
x0 = 1;
A1 = fzero(f1, x0);
save('A1.dat','A1','-ascii')

%problem 2
s = 10;
f2 = @(x) x.^2 - s;
x0 = 3;
A2 = fzero(f2, x0);
save('A2.dat','A2','-ascii')

%problem 3
s = 10;
f2 = @(x) x.^2 - s;
f2_deriv = @(x) 2.*x;
x_init = 1;
for i = 1:20
    x_new = x_init - f2(x_init)/f2_deriv(x_init);
    x_init = x_new; 
end
A3 = x_init;
save('A3.dat','A3','-ascii')

%problem 4
x_init = 1;
x_save = [x_init];
for i = 1:20
    x_new = x_init - f2(x_init)/f2_deriv(x_init);
    x_init = x_new; 
    x_save(i+1, 1) = x_init;
end
A4 = x_save;
save('A4.dat','A4','-ascii')

%problem 7
x_init = 1;
x_save = [x_init];
for i = 1:20
    x_new = x_init - f2(x_init)/f2_deriv(x_init);
    x_init = x_new; 
    x_save(i+1, 1) = x_init;
    if abs(f2(x_init)) < 10^(-8)
        break
    end
end
A5 = x_save;
save('A5.dat','A5','-ascii')