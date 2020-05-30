A = [55 -10 -20; -10 30 -15; -20 -15 65];
b = [20; 10; 5];

x1 = A\b;

clf
hold on; box on
daspect([1 1 1]);
axis([0 2 0 1]);

xticks(0:.2:2);
yticks(0:.2:1);

B = [0.4 0.6
    0.8 0.2
    1.4 0.4
    1.6 0.6]; % input B here!

plot(B(:,1), B(:,2),'ko','markersize',20,'markerfacecolor','w','linewidth',1.5);

% 0 denotes route to same city
% -1 denotes indirect route
route = [0 808 -1 -1 832
    808 0 382 -1 736
    -1 382 0 270 -1
    -1 -1 270 0 421
    832 736 -1 421 0];

%indirect routes are not included
%both directions are included for each route
route2 = [1 2 808
    1 5 832 
    2 1 808
    2 3 736
    2 5 382
    3 2 382
    3 4 270
    4 3 270
    4 5 421
    5 1 832
    5 2 736
    5 4 421];