% Problem 3
values = [1 1];
fvalue = get_f(values);

save('A1.dat','fvalue','-ascii')

% Problem 4
p = [1;1];
pgrad= get_grad(p);
save('A2.dat','pgrad','-ascii')

pnorm = norm(get_grad(p), inf);
save('A3.dat','pnorm','-ascii')

% Problem 5
t = 0.1;
p = [1;1];
pphi = get_phi(t, p);
save('A4.dat','pphi','-ascii')

fpphi = get_fphi(t, p);
save('A5.dat','fpphi','-ascii')

% Problem 6
t_min = fminbnd('get_fphi',0,0.1,[],p);
save('A6.dat','t_min','-ascii')

phi_min = get_phi(t_min, p);
save('A7.dat','phi_min','-ascii')

% Problem 7
p = [1;1];
for i = 1:1000
    t_min = fminbnd('get_fphi',0,0.1,[],p);
    phi_min = get_phi(t_min, p);
    p = phi_min;
    if norm(get_grad(p), inf) < 10^(-4)
        break
    end
end

save('A8.dat','p','-ascii')
save('A9.dat','i','-ascii')

% Problem 8
min1 = fminsearch('get_f',[5;5]);
min2 = fminsearch('get_f',[-5;5]);
min3 = fminsearch('get_f',[-5;-5]);
min4 = fminsearch('get_f',[5;-5]);

local_min = [min1 min2 min3 min4];
save('A10.dat','local_min','-ascii')

%global_min = local_min(:,1);
%f_min = get_f(global_min);
%for j = 1:4
%    if get_f(local_min(:,j)) < f_min
%        f_min = get_f(local_min(:,j));
%        global_min = local_min(:,j);
%    end
%end
%save('A11.dat','global_min','-ascii')
%f_min = f_min * 100^4;
%save('A12.dat','f_min','-ascii')








