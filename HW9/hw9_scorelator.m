% Problem 1
T = 50;
dt = 0.01;
g = 9.8;
l = 10;
A = [0 1;
    -g/l 0];
x0 = [1 0];
x_FE(1,:) = x0;

for i = 1:T/dt
    x_FE(i+1,:) = (eye(2) + dt*A)*(x_FE(i,:).');
end

thsave_FE = x_FE(:,1);
phisave_FE = x_FE(:,2);

save('A1.dat','thsave_FE','-ascii')
save('A2.dat','phisave_FE','-ascii')

% Problem 2
T = 50;
dt = 0.01;
x0 = [1 0];
x_BE(1,:) = x0;

for i = 1:T/dt
    x_BE(i+1,:) = inv(eye(2) - dt*A)*(x_BE(i,:).');
end    

thsave_BE = x_BE(:,1);
phisave_BE = x_BE(:,2);

save('B1.dat','thsave_BE','-ascii')
save('B2.dat','phisave_BE','-ascii')

% Problem 3
x0 = [1 0];
x_LE(1,:) = x0;
x_LE(2,:) = (eye(2) + dt*A)*(x_LE(1,:).');

for i = 2:T/dt
    x_LE(i+1,:) = x_LE(i-1,:).' + 2*dt*A*(x_LE(i,:).');
end    

thsave_LE = x_LE(:,1);
phisave_LE = x_LE(:,2);

save('C1.dat','thsave_LE','-ascii')
save('C2.dat','phisave_LE','-ascii')

% Problem 4
ts = 0:dt:T;
Z0 = [1;0];
odefun = @(t,Z) A*Z;
[tsol,Zsol] = ode45(odefun,ts,Z0);
thsave_ODE45 = Zsol(:,1);
phisave_ODE45 = Zsol(:,2);

save('D1.dat','thsave_ODE45','-ascii')
save('D2.dat','phisave_ODE45','-ascii')

% Problem 7
ts = 0:dt:T;
Z0 = [1;0];

dthedt = @(t,p) p;
dphidt = @(t,p) -g*sin(t)/l;

odefun = @(t,Z) [ dthedt(Z(1),Z(2));
                  dphidt(Z(1),Z(2)) ];
[tsol,Zsol] = ode45(odefun,ts,Z0);
thsave_ODE45 = Zsol(:,1);
phisave_ODE45 = Zsol(:,2);

save('E1.dat','thsave_ODE45','-ascii')
save('E2.dat','phisave_ODE45','-ascii')


