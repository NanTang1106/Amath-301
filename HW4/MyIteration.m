function [sol, error] = MyIteration(M, g, truesol, size, N)

x0 = zeros(N,1);
x(:,1) = x0;
error = [];

for iteration = 1:size
    x(:,iteration + 1) = M*x(:,iteration) + g;
    error(iteration) = norm(abs(truesol-x(:,iteration+1)),2);
end 
sol = x(:,size+1);

