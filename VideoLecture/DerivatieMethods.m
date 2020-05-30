x = -3:0.1:3;
y = -3:0.1:3;
% set X,Y direction in 3D
[X,Y] = meshgrid(x,y);
f = X.^2 + 3*Y.^2;
surf(X,Y,f), hold on

% plot initial guess
clear x
clear y
x(1) = 3;
y(1) = 2;
f(1) = x(1)^2 + 3*y(1)^2;
plot3(x,y,f(1),'ko','Linewidth',3)

for j = 1:100
    tau = (x(j)^2 + 9*y(j)^2)/(2*x(j)^2 + 54*y(j)^2);
    x(j+1) = (1-2*tau)*x(j);
    y(j+1) = (1-6*tau)*y(j);
    f(j+1) = x(j+1)^2 + 3*y(j+1)^2;
    
    plot3(x(j+1),y(j+1),f(j+1),'k.','Markersize',15)
    
    if abs(f(j+1) - f(j)) < 10^(-6)
        break
    end
end
hold off