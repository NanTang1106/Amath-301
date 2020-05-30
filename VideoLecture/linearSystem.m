x1 = [1;5;0];
y1 = [2;8;3];

%transpose x * y 
x1.'*y1

%length of vector = norm vector


%calculate determiner before solve matrix formula
%det(A) determiner != 0 solution is singular, else, nonsingular or no
%solution
%cond(A) alternative way of deteminer, condition number, 
%if condition A is really big, singular, if condition in O(1), nonsigular.

%solve matrix 
A = [1 1 1; 1 2 4;1 3 9];
b = [1; -1; 2];
det(A)
x = A\b;

%create 100 * 100 matrix
A2 = rand(100,100);
b2 = rand(100,1);
det(A2)
x2 = A2\b2;

%use LU decomposition to reduce running time into O(n^2)
[L,U,P] = lu(A);
y3 = L\(P*b);
x3 = U\y3; 