% Problem 1
x = linspace(-5, 5, 31);
y = linspace(-5, 5, 31);

[X,Y] = meshgrid(x,y);
f = (X.^2 + Y -11).^2 + (X + Y.^2 - 7).^2;

clf
set(gcf, 'position', [20 50 500 250], 'paperpositionmode', 'auto')
surf(X,Y,f)
zlim([0 500])
xlim([-5 5])
ylim([-5 5])
colorbar
caxis([0 500])
view(-70, 30)
daspect([1 1 100])
xlabel('x')
ylabel('y')
title('Beale Function')

print(gcf, '-dpng', 'beale_surf.png')


% Problem 2
x2 = linspace(-7, 7, 100);
y2 = linspace(-6, 6, 100);
[X2,Y2] = meshgrid(x2,y2);
f2 = (X2.^2 + Y2 -11).^2 + (X2 + Y2.^2 - 7).^2;

clf
set(gcf, 'position', [20 50 500 250], 'paperpositionmode', 'auto')
contourf(X2,Y2,f2,logspace(-1, 3, 21))
xlim([-7 7])
ylim([-6 6])
colorbar
caxis([0 500])
daspect([1 1 100])
xlabel('x')
ylabel('y')
title('Contours of the Beale Function')

print(gcf, '-dpng', 'beale_contour.png')


% Problem 9
% minimum found by fminsearch
min1 = fminsearch('get_f',[5;5]);
min2 = fminsearch('get_f',[-5;5]);
min3 = fminsearch('get_f',[-5;-5]);
min4 = fminsearch('get_f',[5;-5]);
local_min = [min1 min2 min3 min4];

% minimum found by gradient descent
p = [1;1];
for i = 1:1000
    t_min = fminbnd('get_fphi',0,0.1,[],p);
    phi_min = get_phi(t_min, p);
    p = phi_min;
    if norm(get_grad(p), inf) < 10^(-4)
        break
    end
end

% find global minimum
global_min = local_min(:,1);
f_min = get_f(global_min);
for j = 1:4
    if get_f(local_min(:,j)) < f_min
        f_min = get_f(local_min(:,j));
        global_min = local_min(:,j);
    end
end

clf
set(gcf, 'position', [20 50 500 250], 'paperpositionmode', 'auto')
contourf(X2,Y2,f2,logspace(-1, 3, 21)), hold on
plot(local_min(1,:), local_min(2,:), 'ro')
plot(p(1), p(2), 'y*')
plot(global_min(1), global_min(2), 'g+')
xlim([-7 7])
ylim([-6 6])
colorbar
caxis([0 500])
daspect([1 1 100])
xlabel('x')
ylabel('y')
title('Minima of the Beale Function')

print(gcf, '-dpng', 'beale_minima.png')

