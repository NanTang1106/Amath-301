function e=calerror(init)
load('fitdata.mat');

mu = init(1);
sigma2 = init(2);

e = sum(abs(1/sqrt(2*pi*sigma2).*exp(-(X-mu).^2/(2*sigma2)) - Y).^2);
