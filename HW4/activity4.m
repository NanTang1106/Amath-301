clf
axis equal
hold on
compass(x(1),x(2))
x1 = [-0.8;1];
A = [-0.125 -1.875;
    -0.5 0.375];
y1 = A\x1;