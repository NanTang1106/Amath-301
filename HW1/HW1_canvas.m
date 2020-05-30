xs = linspace(-2 * pi, 2 * pi);
f = @(x) 1 - x.^2 / 2;
clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs));
print(gcf, '-dpng', 'plot_a.png');
hold off

clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
print(gcf, '-dpng', 'plot_b.png');
hold off

clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
xlabel('Space, x');
print(gcf, '-dpng', 'plot_c.png');
hold off

clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
xlabel('Space, x');
title('Taylor Approximation of Cosine');
print(gcf, '-dpng', 'plot_d.png');
hold off

clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
xlabel('Space, x');
title('Taylor Approximation of Cosine');
legend('cos(x)', '1 - x^2/2', 'Location', 'South')
print(gcf, '-dpng', 'plot_e.png');
hold off

clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
xlim([-2 * pi, 2 * pi]);
ylim([-3, 1.5]);
xlabel('Space, x');
title('Taylor Approximation of Cosine');
legend('cos(x)', '1 - x^2/2', 'Location', 'South')
print(gcf, '-dpng', 'plot_f.png');
hold off

clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
xlim([-2 * pi, 2 * pi]);
ylim([-3, 1.5]);
xticks(-6:2:6);
xlabel('Space, x');
title('Taylor Approximation of Cosine');
legend('cos(x)', '1 - x^2/2', 'Location', 'South')
print(gcf, '-dpng', 'plot_g.png');
hold off


clf
hold on 
plot(xs, cos(xs), 'k', 'Linewidth', 3);
plot(xs, f(xs), 'r--', 'Linewidth', 2);
xlim([-2 * pi, 2 * pi]);
ylim([-3, 1.5]);
xticks(-6:2:6);
yticks(-3:1:1);
xlabel('Space, x');
title('Taylor Approximation of Cosine');
legend('cos(x)', '1 - x^2/2', 'Location', 'South')
print(gcf, '-dpng', 'plot_h.png');
hold off

