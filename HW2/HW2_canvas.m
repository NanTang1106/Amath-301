%problem 5
s = 10;
f2 = @(x) x.^2 - s;
f2_deriv = @(x) 2.*x;
x_correct = sqrt(s);
x_init = 1;
x_save = [x_init];
for i = 1:20
    x_new = x_init - f2(x_init)/f2_deriv(x_init);
    x_init = x_new; 
    x_save(i+1,1) = x_init;
end
x_error = abs(x_save - x_correct);

clf
plot(0:20, x_error,'.','MarkerSize',15)
xticks(0:20)
xlabel('Number of iteration')
ylabel('Error')
title("Convergence of Newton's Method")
box off

print(gcf, '-dpng', 'newton_error.png');

%Problem 6
clf
semilogy(0:20, x_error,'.','MarkerSize',15)
xlabel('Number of iteration')
xticks(0:20)
ylabel('Logarithmic value of error')
title("Convergence of Newton's Method")
box off

print(gcf, '-dpng', 'newton_error_log.png');

%Problem 8
clf
xs = linspace(-1,6);
plot(xs, 0*xs, 'k-');
hold on
plot(xs, f2(xs),'b-');

x_init = 1;
plot(x_init, 0, 'rx')
for i = 1:20
    line([x_init,x_init],[0,f2(x_init)],'Color','red','LineStyle','--')
    plot(x_init, f2(x_init),'ro')
    x_new = x_init - f2(x_init)/f2_deriv(x_init);
    line([x_init,x_new],[f2(x_init),0],'Color','red')
    plot(x_new, 0, 'rx')
    x_init = x_new; 
end
title("Newton's Root-finding Method");
box off 

print(gcf, '-dpng', 'newton_babylon_iterations.png');
