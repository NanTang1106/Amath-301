function grad = get_grad(values)

x = values(1);
y = values(2);

x_deriv = 4*x*(x^2 + y -11) + 2*(x + y^2 - 7);
y_deriv = 2*(x^2 + y - 11) + 4*y*(x + y^2 - 7);

grad = [x_deriv; y_deriv];