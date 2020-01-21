% Prints a menu and calculates area of user's choice

disp('Menu')
disp('1. Cylinder')
disp('2. Circle')
disp('3. Rectangle')
choice = input('Please choose one: ');

switch choice
case 1
    rad = input('Enter the radius of the cylinder: ');
    ht = input('Enter the height of the cylinder: ');
    fprintf('The surface area is %.2f\n', 2*pi*rad*ht)
case 2
    rad = input('Enter the radius of the circle: ');
    fprintf('The area is %.2f\n', pi*rad*rad)
case 3
    len = input('Enter the length: ');
    wid = input('Enter the width: ');
    fprintf('The area is %.2f\n', len*wid)
    otherwise
    disp('Error! Not a valid choice.')
end