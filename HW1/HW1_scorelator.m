%problem 1
A = [1 2; 3 4];
B = [-2 1;1 -2];
C = [2 -7; -3 4; 5 -1];
x = [13; -4];
y = [5;3];
z = [4; 7; -3];

A1 = 7 * x;
save('A1.dat','A1','-ascii')

A2 = x + y;
save('A2.dat','A2','-ascii')

A3 = 3 * x - 2 * y;
save('A3.dat','A3','-ascii')

A4 = 0.01 * B;
save('A4.dat','A4','-ascii')

A5 = A - B;
save('A5.dat','A5','-ascii')

A6 = A * x;
save('A6.dat','A6','-ascii')

A7 = B * A;
save('A7.dat','A7','-ascii')

A8 = C.';
save('A8.dat','A8','-ascii')

A9 = z.';
save('A9.dat','A9','-ascii')

A10 = C * A;
save('A10.dat','A10','-ascii')

%problem 2
u = 1:7;
v = 0:0.5:3;
D = magic(6);

B1 = u .* v;
save('B1.dat','B1','-ascii')

B2 = v ./ u;
save('B2.dat','B2','-ascii')

B3 = u .^ 3;
save('B3.dat','B3','-ascii')

B4 = 2 .^ u;
save('B4.dat','B4','-ascii')

B5 = cos(u);
save('B5.dat','B5','-ascii')

B6 = v(2 : 2: end);
save('B6.dat','B6','-ascii')

B7 = D(:, 2);
save('B7.dat','B7','-ascii')

B8 = D(3, :);
save('B8.dat','B8','-ascii')

B9 = D(3:4, 3:4);
save('B9.dat','B9','-ascii')

B10 = D(2:5, 2:5);
save('B10.dat','B10','-ascii')