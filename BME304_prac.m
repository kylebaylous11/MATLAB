%Matrix

%Mat = [1 2 4 5; 2 3 6 8];

%Mat(2,3)

%Mat(1,4)

radius = (0:1:20);
area = pi*radius.^2;

surfarea = 4*pi*radius.^2;

plot(radius,area,'m*')

hold on

plot(radius,surfarea,'b--')

hold off

title('Radius vs Area')

xlabel('Radius (m)')
ylabel('Area (m^2)')

legend('Area Circle', 'Surface Area Sphere')



%clc

