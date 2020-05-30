%Problem 1
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

save('A1.dat','formula','-ascii')

%Problem 2
W7 = 800;
W8 = 900; 
W9 = 13000;
external_force = zeros(15, 1);
external_force([11 13 15],1) = [W7 W8 W9];
force = formula\external_force;

save('A2.dat','force','-ascii')

max_force = max(abs(force));

save('A3.dat','max_force','-ascii')

%problem 5
[L,U,P] = lu(formula);

save('A4.dat','L','-ascii')

save('A5.dat','U','-ascii')

save('A6.dat','P','-ascii')

W7 = 800;
W8 = 900;
W9 = 13000;
external_force = zeros(15, 1);
external_force([11 13 15],1) = [W7 W8 W9];

y = L\(P*external_force);

save('A7.dat','y','-ascii')

force = U\y;

save('A8.dat','force','-ascii')

%Problem 6
for i = 1:inf
    W9 = W9 + 0.1;
    external_force(15, 1) = W9;
    y = L\(P*external_force);
    force = U\y;
    max_force = max(abs(force));
    if max_force > 20000
        save('A9.dat','W9','-ascii')
        save('A10.dat','force','-ascii')    
        break;
    end 
end




