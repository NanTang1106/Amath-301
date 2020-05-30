%row vector
x = [1 2 3];

%column vector
y = [1; 2; 3];

%create vector by increment 
%begin:increment:end
%z1=(1,2,3...10)
z1 = 1:1:10; 
%begin number is included, but final is not necessary included
%z2=(0,2,4,6,8)
z2 = 0:2:9;
%Note: default increment is 1

%matrix A=n*m row*col
A1 = [1 2 3; 5 6 7; 8 9 10];
A2 = [1 2 3
    5 6 7
    8 9 10];
%row 3 col 2 in A1
a1 = A1(3,2);
%all cols in row 3
a2 = A1(3,:);
%col 2 to end on row 3
a3 = A1(3, 2:end);
%col 1 to end - 1 on row 3
a4 = A1(3, 1:end-1);
%col 1 to 3 on row 1 and row 1 to 3 on col 2
%Note ".'" turns col vector into row vector
%a5= [1 2 3 ; 2 6 9]
a5 = [A1(1, 1:3); A1(1:3, 2).'];



