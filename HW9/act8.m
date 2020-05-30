clc
clear

% model parameters
m = 5;
k = 1;
x0 = 3;
v0 = 1;

% model equations
dxdt = @(x,v) v;
dvdt = @(x,v) -k*x/m;

% numerical solution with ode45
endtime = 20;
ts = 0:.1:endtime;
Z0 = [x0;v0];
odefun = @(t,Z) [ dxdt(Z(1),Z(2));
                  dvdt(Z(1),Z(2)) ];
[tsol,Zsol] = ode45(odefun,ts,Z0);

wall = -10;
coilamp = 3;
amp = .5;

clf
hold on
axis equal
xlim([-10 10]);
for nn = 1:numel(tsol)
    xpos = Zsol(nn,1);
    
    cla
    
    % drawing the spring
    a = wall; b = xpos-1;
    Nturns = 15;
    ts = linspace(-pi/2,Nturns*2*pi+pi/2,1000);
    xs = ts + coilamp*sin(ts);
    xs = a+(b-a)*(xs-(-pi/2-coilamp))/(Nturns*2*pi + pi+2*coilamp);
    ys = amp*sin(ts+pi/2);
    plot(xs,ys,'k');
    
    hold on
    patch(xpos+[-1 1 1 -1],[-1 -1 1 1],'k');
    title( sprintf('Time = %0.1f',tsol(nn)) );
    pause(.03);
end

%% phase portrait code goes here!


clf
hold on
axis equal
% draw axes
plot([-6 6],[0 0],'k') 
hold on
plot([0 0],[-5 5],'k')

% draw arrows
xvec = [-5: 0.5: 5];
vvec = [-5: 0.5: 5];
[x,v] = meshgrid(xvec, vvec);
quiver(x,v,dxdt(x,v), dvdt(x,v))
plot(Zsol(:,1),Zsol(:,2),'r')
% draw trajectory


