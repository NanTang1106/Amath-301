% Spring Mass Damper
% natural frequencey
w = 2 * pi;
% damping rate
d = 0.25;
% Spring mass damper system
A = [0 1;
    -w^2 -2*d*w];
% time step
dt = 0.01;
T = 10;
% iterate forward euler scheme
x0 = [2; 0]; % position, velocity 
xF(:,1) = x0;
tF(1) = 0;
for k = 1:T/dt
    tF(k+1) = k*dt;
    xF(:,k+1) = (eye(2) + dt*A) * xF(:,k);
end

plot(tF, xF(1,:))
plot(xF(1,:), xF(2,:))

% interate backward euler 
x0 = [2; 0]; % position, velocity 
xB(:,1) = x0;
tB(1) = 0;
for k = 1:T/dt
    tB(k+1) = k*dt;
    xB(:,k+1) = inv(eye(2) - dt*A) * xB(:,k);
end

plot(tB, xB(1,:))
plot(xB(1,:), xB(2,:))

% build in integrator
[t, xGood] = ode45(@(t,x) A*x, 0:dt:T, x0);
plot(t, xGood(:,1))

clf
hold on
plot(tF, xF(1,:),'b')
plot(tB, xB(1,:),'g')
plot(t, xGood(:,1),'r')
legend('Forward', 'Backward', 'ode45')
