function result = get_phi(t, values)

grad = get_grad(values);

result = values - t.*grad;


