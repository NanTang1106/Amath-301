%original system of equations
A = [4 -1 1;
    4 -8 1;
    -2 1 5];

B = [7;-21;15];

%JACOBI iteration   
M = [0 1/4 -1/4;
    1/2 0 1/8;
    2/5 -1/5 0];
b2 = [7/4; 21/8; 15/5];

x0 = [1; 2; 2];
tol = 1.e-6;
error = 2 * tol;
x(:,1) = x0;
iteration = 1;
while((error>tol)&&(iteration<100))
    iteration = iteration + 1;
    x(:,iteration) = M*x(:,iteration-1) + b2;
    error = norm(x(:,iteration)-x(:,iteration-1),inf);
end 
trueIteration = iteration - 1;

plot(x')

%conditions of JACOBI:
%strict diagonal dominance (abs value on diagonal greater than sum of others
%in same row.
%eigenvalues

%eigenvalue: A*x = lamda*I*x
%A-lamda*I is singular,that is determinant(A-lamda*I) = 0

A2 = [3 -1;-1 3];
eig(A2);

%eigen vector and eigen values
[T,D] = eig(A2);
%A = TDT^-1

A3 = [A(3,:)
    A(2,:)
    A(1,:)];
d1 = diag(diag(A));
d3 = diag(diag(A3));
t1 = A-d1;
t3 = A3-d3;

%eigenvalues of D^-1*T
eig1 = abs(eig(d1\t1));

eig3 = abs(eig(d3\t3));







