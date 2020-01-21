%graph
% Prompt the user for the coordinates of a point and plot
% the point using a green +
x = input('Enter the x coordinate: ');
y1 = input('Enter the y1 coordinate: ');
y2 = input('Enter the y2 coordinate: ');

figure(1)
plot(x,y1)
xlabel('x')
ylabel('y')
title('x vs y plot')
figure(2)
plot(x,y1,'k-')
hold on
plot(x,y2,'r-')
xlabel('x')
ylabel('y')
legend('y1','y2')
grid on
title('x vs y1 & y2')


