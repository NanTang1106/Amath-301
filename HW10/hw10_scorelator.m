% Problem 1
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

the500 = zsol(1:500,1);
phi500 = zsol(1:500,2);

save('A1.dat','the500','-ascii')
save('A2.dat','phi500','-ascii')

% Problem 4
ts = 0:dt:T;
dthedt = @(t,the,phi) phi;
dphidt = @(t,the,phi) -g*sin(the)/l;

[tsol, thesol, phisol] = symplecticEuler(dthedt,dphidt,ts,3.1,0);

the500 = thesol(1:500);
phi500 = phisol(1:500);

save('B1.dat','the500','-ascii')
save('B2.dat','phi500','-ascii')

% Problem 7
load('tprism_spec.mat')
X = nodes;
nodesf = calcSpringForces(X, springs);
save('C1.dat','nodesf','-ascii')

% Problem 8
c = 5;
dt = 0.01;
ts = 0:dt:50;
X0 = nodes;
V0 = zeros(6,3);
dXdt = @(t,X,V) V;
dVdt = @(t,X,V) calcSpringForces(X, springs)-c*V;

[tsol, Xsol, Vsol] = symplecticEuler(dXdt,dVdt,ts,X0,V0);

save('D1.dat','Xsol','-ascii')
save('D2.dat','Vsol','-ascii')

% Problem 9
Xrest = Xsol(end,:);
save('E1.dat','Xrest','-ascii')

% Problem 10
[nodesF2, augmentSpring] = calcSpringForces(Xrest,springs);
save('F1.dat','nodesF2','-ascii')

springRest = augmentSpring(:,end);
save('F2.dat','springRest','-ascii')
