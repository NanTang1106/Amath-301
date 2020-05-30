function x = ximpact(theta, y0)

g = 9.8;
v0 = 10;
x0 = 0;

t = @(theta) sqrt(2*y0/g+(v0.*sin(theta)./g).^2) + v0.*sin(theta)./g;

x = -(x0 + v0.*cos(theta).*t(theta));
