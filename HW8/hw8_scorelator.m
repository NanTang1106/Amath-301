load('Plutonium.mat')

% Problem 1
t = 1980;
dpdt1_c = (findp(t+1) - findp(t-1)) / 2;

save('A1.dat','dpdt1_c','-ascii')

% Problem 2
t = 1970;
dpdt1_f = (findp(t+1) - findp(t)) / 1;

save('A2.dat','dpdt1_f','-ascii')

% Problem 3
t = 2010;
dpdt1_b = (findp(t) - findp(t-1)) / 1;

save('A3.dat','dpdt1_b','-ascii')

% Problem 4
t = (1970:1:2010).';
dpdt1_m = zeros(length(tdata), 1);

dpdt1_m(1) = (findp(t(1)+1) - findp(t(1))) / 1;
for i = 2:length(t)-1
    dpdt1_m(i) = (findp(t(i+1)) - findp(t(i-1))) / 2;
end
dpdt1_m(length(t)) = (findp(t(length(t))) - findp(t(length(t))-1)) / 1;

save('A4.dat','dpdt1_m','-ascii')

% Problem 5
pdecay_rt = -findp(t).^(-1) .* dpdt1_m;
gamma = mean(pdecay_rt);

save('A5.dat','gamma','-ascii')

% Problem 6
phalflife = log(2) / gamma;
save('A6.dat','phalflife','-ascii')

% Problem 8
mu = 1;
sigmasq = 4;
a = 2;
b = 4;
deltax = 1;
area_l = 0;
px = @(x) exp((-(x-mu).^2) ./ (2*sigmasq));

for i = a:deltax:b-deltax
    area_l = area_l + px(i) * deltax;
end 

save('B1.dat','area_l','-ascii')

areas_l = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    area = sum(px(a:j:b-j))*j;
    areas_l(count) = area;
    count = count + 1;
end

save('B2.dat','areas_l','-ascii')

areas_r = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    area = sum(px(a+j:j:b))*j;
    areas_r(count) = area;
    count = count + 1;
end

save('B3.dat','areas_r','-ascii')

% Problem 9
areas_tri = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    x = a:j:b;
    p = px(x);
    area = trapz(x, p);
    areas_tri(count) = area;
    count = count + 1;
end

save('B4.dat','areas_tri','-ascii')

% Problem 10
areas_simpson = zeros(17, 1);
count = 1;

for j = 2.^(0:-1:-16)
    area = j/3*(px(a) + 4*sum(px(a+j:2*j:b-j)) + 2*sum(px(a+2*j:2*j:b-2*j)) + px(b));
    areas_simpson(count) = area;
    count = count + 1;
end

save('B5.dat','areas_simpson','-ascii')

% Problem 11
truesol = integral(px, a, b);
save('B6.dat','truesol','-ascii')


