% Problem 5
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

x_BE(1,:) = x0;
for i = 1:T/dt
    x_BE(i+1,:) = inv(eye(2) - dt*A)*(x_BE(i,:).');
end    
thsave_BE = x_BE(:,1);
phisave_BE = x_BE(:,2);

x_LE(1,:) = x0;
x_LE(2,:) = (eye(2) + dt*A)*(x_LE(1,:).');
for i = 2:T/dt
    x_LE(i+1,:) = x_LE(i-1,:).' + 2*dt*A*(x_LE(i,:).');
end    
thsave_LE = x_LE(:,1);
phisave_LE = x_LE(:,2);

ts = 0:dt:T;
clf
set(gcf, 'position', [100 100 800 500], 'paperpositionmode', 'auto')
hold on
plot(ts, thsave_FE, 'r')
plot(ts, thsave_BE, 'm')
plot(ts, thsave_LE, 'b')
yline(1, 'k:')
xlabel('Time')
ylabel('Angle of Deflection \theta')
legend('Forward Euler','Backword Euler','Leapfrog','Maximum Amplitude',...
    'Location', 'SouthWest')
title('Linear Pendulum Solutions')

print(gcf, '-dpng', 'linear_pendulum_solutions.png')

% Problem 5
thetaVec = -2:0.2:2;
phiVec = -2:0.2:2;
[theta,phi] = meshgrid(thetaVec,phiVec);
dthedt = @(t,p) p;
dphidt = @(t,p) -g*t/l;

clf
hold on
axis equal
xlim([-2,2])
ylim([-2,2])
xlabel('\theta')
ylabel('\phi')
title('Phase Portrait and Linear Solutions')
plot(thsave_FE,phisave_FE,'r')
plot(thsave_BE,phisave_BE,'m')
plot(thsave_LE,phisave_LE,'b')
quiver(theta,phi,dthedt(theta,phi),dphidt(theta,phi))
legend('Forward Euler','Backword Euler','Leapfrog','Location', 'SouthEast')

print(gcf, '-dpng', 'linear_phase_portrait.png')

% Problem 8
thetaVec2 = linspace(-2*pi,2*pi,25);
phiVec2 = (-3:0.5:4);
[theta2,phi2] = meshgrid(thetaVec2,phiVec2);
dthedt = @(t,p) p;
dphidt = @(t,p) -g*sin(t)/l;
odefun = @(t,Z) [ dthedt(Z(1),Z(2));
                  dphidt(Z(1),Z(2)) ];
                                         
[tsol1,Zsol1] = ode45(odefun,ts,[0.1;0]);
[tsol2,Zsol2] = ode45(odefun,ts,[1;0]);
[tsol3,Zsol3] = ode45(odefun,ts,[3;0]);
[tsol4,Zsol4] = ode45(odefun,ts,[-2*pi;2.1]);
[tsol5,Zsol5] = ode45(odefun,ts,[-2*pi;3]);

clf
hold on
axis equal
xlim([-2*pi,2*pi])
ylim([-3,4])
xlabel('\theta')
ylabel('\phi')
title('Non-Linear Phase Portrait')
quiver(theta2,phi2,dthedt(theta2,phi2),dphidt(theta2,phi2))
plot(Zsol1(:,1),Zsol1(:,2))
plot(Zsol2(:,1),Zsol2(:,2))
plot(Zsol3(:,1),Zsol3(:,2))
plot(Zsol4(:,1),Zsol4(:,2))
plot(Zsol5(:,1),Zsol5(:,2))

print(gcf, '-dpng', 'nonlinear_phase_portrait.png')




