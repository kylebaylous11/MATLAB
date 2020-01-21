%prompt the user for the radius and height
r=input('Enter the radius: ');
h=input('Enter the height: ');
%calculate the volume by using r and h
v=pi.*r.^2.*h;
disp(v)
%display the result for scalar input
fprintf('The volume of the cylinder for radius ') 
fprintf('%.2f and height %.2f is %.2f.\n',r,h,v)
