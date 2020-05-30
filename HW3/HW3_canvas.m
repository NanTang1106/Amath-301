%Problem 3
nodes = [0 0
    0.5 sqrt(3)/2 
    1.5 sqrt(3)/2 
    2.5 sqrt(3)/2 
    3.5 sqrt(3)/2 
    4 0
    3 0
    2 0
    1 0];

beams = [1 2
    2 3
    3 4
    4 5 
    5 6
    6 7
    7 8 
    8 9 
    9 1
    2 9 
    3 9 
    3 8 
    4 8 
    4 7
    5 7];

clf 
set(gcf, 'position', [20 50 600 250], 'paperpositionmode', 'auto')
hold on
for i = 1:15
    current = beams(i,:);
    plot(nodes(current, 1), nodes(current, 2))    
end 
axis equal;
axis([-0.5 4.5 -0.5 1.5]);

print(gcf, '-dpng', 'truss_bridge_beams.png'); 

%Problem 4
%calculate 15 forces
formula = zeros(15, 15);
formula(1,[1 2 10]) = [-1/2 1 1/2];
formula(2,[1 10]) = [-sqrt(3)/2 -sqrt(3)/2];
formula(3,[2 3 11 12]) = [-1 1 -1/2 1/2];
formula(4,[11 12]) = [-sqrt(3)/2 -sqrt(3)/2];
formula(5,[3 4 13 14]) = [-1 1 -1/2 1/2];
formula(6,[13 14]) = [-sqrt(3)/2 -sqrt(3)/2];
formula(7,[4 5 15])= [-1 1/2 -1/2];
formula(8,[5 15]) = [-sqrt(3)/2 -sqrt(3)/2];
formula(9,[5 6]) = [-1/2 -1];
formula(10,[6 7 14 15]) = [1 -1 -1/2 1/2];
formula(11,[14 15]) = [sqrt(3)/2 sqrt(3)/2];
formula(12,[7 8 12 13]) = [1 -1 -1/2 1/2];
formula(13,[12 13]) = [sqrt(3)/2 sqrt(3)/2];
formula(14,[8 9 10 11]) = [1 -1 -1/2 1/2];
formula(15,[10 11]) = [sqrt(3)/2 sqrt(3)/2];
W7 = 800;
W8 = 900;
W9 = 13000;
external_force = zeros(15, 1);
external_force([11 13 15],1) = [W7 W8 W9];
force = formula\external_force;

%plot based on strength of each force
clf 
set(gcf, 'position', [20 50 600 250], 'paperpositionmode', 'auto')
hold on
for i = 1:15
    current = beams(i,:);
    F = force(i);
    modify_F = abs(F/1000);
    color = 'red';
    if F > 0
       color = 'green'; 
    end
    plot(nodes(current, 1),nodes(current, 2),'Color',color,'LineWidth',modify_F);  
end 
plot(nodes(:,1),nodes(:,2),'.','MarkerSize',80,'Color','Black');
axis equal;
axis([-0.5 4.5 -0.5 1.5]);

print(gcf, '-dpng', 'truss_bridge_forces.png');

%Problem 7
%calculate forces when at least one beam breaks.
[L,U,P] = lu(formula);
y = L\(P*external_force);
force = U\y;
for i = 1:inf
    W9 = W9 + 0.1;
    external_force(15, 1) = W9;
    y = L\(P*external_force);
    force = U\y;
    max_force = max(abs(force));
    if max_force >= 20000    
        break;
    end 
end
%plot breaking bridge
clf 
%expand panal area to make breaking beam easy to be found.
set(gcf, 'position', [20 50 600 400], 'paperpositionmode', 'auto')
hold on
for i = 1:15
    current = beams(i,:);
    F = force(i);
    modify_F = abs(F/1000);  
    if F > 0
        plot(nodes(current, 1),nodes(current, 2),'-g','LineWidth',modify_F);
    else 
        plot(nodes(current, 1),nodes(current, 2),'-r','LineWidth',modify_F);
    end
end 
plot(nodes(:,1),nodes(:,2),'.','MarkerSize',80,'Color','Black');
axis equal;
axis([-0.5 4.5 -0.5 1.5]);

print(gcf, '-dpng', 'truss_bridge_breakingpoint_forces.png');




