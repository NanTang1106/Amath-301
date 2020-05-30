% Problem 2
g = 9.8;
l = 10;
T = 100;
dt = 0.1;
ts = 0:dt:T;

dthedt = @(the,phi) phi;
dphidt = @(the,phi) -g*sin(the)/l;

Z0 = [3.1;0];

odefun = @(t,Z) [ dthedt(Z(1),Z(2));
                  dphidt(Z(1),Z(2)) ];
[tsol,zsol] = ode45(odefun,ts,Z0);

clf
set(gcf, 'position', [100 100 800 400], 'paperpositionmode', 'auto')
hold on
plot(ts, zsol(:,1))
plot(ts, zsol(:,2))
xlim([0,T])
xlabel('Time')
legend('\theta', '\phi', 'Location', 'SouthWest')
title('Physically Unrealistic Numerical Solution')

print(gcf, '-dpng', 'non_conservative_pendulum.png')

% Problem 3
theVec = -6:0.5:6;
phiVec = -4:0.5:4;
ts = 0:0.1:1000;
[thegrid, phigrid] = meshgrid(theVec, phiVec);
[tsol, zsol1] = ode45(odefun,ts,[1;0]);
[tsol, zsol2] = ode45(odefun,ts,[2;0]);
[tsol, zsol3] = ode45(odefun,ts,[3.1;0]);

clf
set(gcf, 'position', [100 100 800 400], 'paperpositionmode', 'auto')
hold on
plot(zsol1(:,1), zsol1(:,2),'.')
plot(zsol2(:,1), zsol2(:,2),'.')
plot(zsol3(:,1), zsol3(:,2),'.')
quiver(thegrid, phigrid, dthedt(thegrid, phigrid), dphidt(thegrid, phigrid))
xlim([-6,6])
ylim([-4,4])
xlabel('\theta')
ylabel('\phi')
legend('\theta = 1, \phi = 0','\theta = 2, \phi = 0','\theta = 3.1, \phi = 0')
title('Phase Portrait with ode45 Trajectories')

print(gcf, '-dpng', 'pendulum_phase_ode45.png')

% Problem 5
ts = 0:dt:T;
dthedt2 = @(t,the,phi) phi;
dphidt2 = @(t,the,phi) -g*sin(the)/l;

[tsol, thesol, phisol] = symplecticEuler(dthedt2,dphidt2,ts,3.1,0);

clf
set(gcf, 'position', [100 100 800 400], 'paperpositionmode', 'auto')
hold on
plot(ts, thesol(:))
plot(ts, phisol(:))
xlim([0,T])
xlabel('Time')
legend('\theta', '\phi', 'Location', 'NorthEast')
title('Energy-Conserving Numerical Solution')

print(gcf, '-dpng', 'conservative_pendulum.png')

% Problem 6
ts = 0:0.1:1000;
[tsol, thesol1, phisol1] = symplecticEuler(dthedt2,dphidt2,ts,1,0);
[tsol, thesol2, phisol2] = symplecticEuler(dthedt2,dphidt2,ts,2,0);
[tsol, thesol3, phisol3] = symplecticEuler(dthedt2,dphidt2,ts,3.1,0);

clf
set(gcf, 'position', [100 100 800 400], 'paperpositionmode', 'auto')
hold on
plot(thesol1(:), phisol1(:),'.')
plot(thesol2(:), phisol2(:),'.')
plot(thesol3(:), phisol3(:),'.')
quiver(thegrid, phigrid, dthedt(thegrid, phigrid), dphidt(thegrid, phigrid))
xlim([-6,6])
ylim([-4,4])
xlabel('\theta')
ylabel('\phi')
legend('\theta = 1, \phi = 0','\theta = 2, \phi = 0','\theta = 3.1, \phi = 0')
title('Phase Portrait with Symplectic Euler Trajectories \Delta t = 0.1')

print(gcf, '-dpng', 'pendulum_phase_sympEuler_dt_0.1.png')

ts = 0:0.5:1000;
[tsol, thesol1, phisol1] = symplecticEuler(dthedt2,dphidt2,ts,1,0);
[tsol, thesol2, phisol2] = symplecticEuler(dthedt2,dphidt2,ts,2,0);
[tsol, thesol3, phisol3] = symplecticEuler(dthedt2,dphidt2,ts,3.1,0);

clf
set(gcf, 'position', [100 100 800 400], 'paperpositionmode', 'auto')
hold on
plot(thesol1(:), phisol1(:),'.')
plot(thesol2(:), phisol2(:),'.')
plot(thesol3(:), phisol3(:),'.')
quiver(thegrid, phigrid, dthedt(thegrid, phigrid), dphidt(thegrid, phigrid))
xlim([-6,6])
ylim([-4,4])
xlabel('\theta')
ylabel('\phi')
legend('\theta = 1, \phi = 0','\theta = 2, \phi = 0','\theta = 3.1, \phi = 0')
title('Phase Portrait with Symplectic Euler Trajectories \Delta t = 0.5')

print(gcf, '-dpng', 'pendulum_phase_sympEuler_dt_0.5.png')

% Problem 11
load('tprism_spec.mat')
c = 5;
dt = 0.01;
ts = 0:dt:50;
X0 = nodes;
V0 = zeros(6,3);
dXdt = @(t,X,V) V;
dVdt = @(t,X,V) calcSpringForces(X, springs)-c*V;

[tsol, Xsol, Vsol] = symplecticEuler(dXdt,dVdt,ts,X0,V0);
Xrest = Xsol(end,:);

[nodesF2, augmentSpring] = calcSpringForces(Xrest,springs);

clf
set(gcf, 'position', [100 100 400 400], 'paperpositionmode', 'auto')
hold on
drawSpringMassSystem(Xrest,springs)
view([-10 30])
title('Spring Mass System After Relaxation')

print(gcf, '-dpng', 'tprism_side.png')

clf
set(gcf, 'position', [100 100 400 400], 'paperpositionmode', 'auto')
hold on
drawSpringMassSystem(Xrest,springs)
view([0 90])
title('Spring Mass System After Relaxation')

print(gcf, '-dpng', 'tprism_above.png')

