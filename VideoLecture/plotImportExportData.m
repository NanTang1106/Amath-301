x1 = -10:0.1:10;
y1 = sin(x1);

x2 = [-5 sqrt(3) pi 4];
y2 = sin(x2);

%-10 to 10 cuted into 64 points linearly
x3 = linspace(-10, 10, 64);
%Note ".*" do component product
y3 = x3.*sin(x3);

%"hold on" sticks one on previous one
plot(x1, y1,'Linewidth',3), hold on  
%"ko' plot four points
%'Linewidth',3 controls line width 
plot(x2, y2, 'ko', 'Linewidth',1), hold on

plot(x3, y3, 'm:d')

xlabel('x values','Fontsize',10)
ylabel('y values' )
title('my graph')

%set all current access to size 16 
set(gca,'Fontsize', 15)
%place the legend into best location
%check help legend
legend('data1', 'data2', 'data3', 'Location', 'Best')

clear 

x1 = -10:0.1:10;
y1 = sin(x1);

x2 = [-5 sqrt(3) pi 4];
y2 = sin(x2);

%-10 to 10 cuted into 64 points linearly
x3 = linspace(-10, 10, 64);
%Note ".*" do component product
y3 = x3.*sin(x3);

%panel divided into two rows on column and put things on 1st row
subplot(2,1,1)
plot(x1, y1,'Linewidth',3), hold on  
%"ko' plot four points
%'Linewidth',3 controls line width 
plot(x2, y2, 'ko', 'Linewidth',1)
%add a text on axis point
text(-8, 0 , 'stuff')


subplot(2,1,2)
plot(x3, y3, 'm:d')
grid on 