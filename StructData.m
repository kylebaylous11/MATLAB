%This script includes code that creates a structure that stores the element
%name, symbol, number, and mass of periodic table elements up to Neon
%Kyle Baylous SBU ID:111374388

clear elementS

%Create structure array 
elementS(1)=struct('Name','Hydrogen','Symbol','H','Number',1,'Mass',1.0079);
elementS(2)=struct('Name','Helium','Symbol','He','Number',2,'Mass',4.0026);
elementS(3)=struct('Name','Lithium','Symbol','Li','Number',3,'Mass',6.941);
elementS(4)=struct('Name','Beryllium','Symbol','Be','Number',4,'Mass',9.0122);
elementS(5)=struct('Name','Boron','Symbol','B','Number',5,'Mass',10.811);
elementS(6)=struct('Name','Carbon','Symbol','C','Number',6,'Mass',12.011);
elementS(7)=struct('Name','Nitrogen','Symbol','N','Number',7,'Mass',14.007);
elementS(8)=struct('Name','Oxygen','Symbol','O','Number',8,'Mass',15.999);
elementS(9)=struct('Name','Fluorine','Symbol','F','Number',9,'Mass',18.998);
elementS(10)=struct('Name','Neon','Symbol','Ne','Number',10,'Mass',20.180);
%Display structure array fields 
elementS
%Display each component 
for i=1:length(elementS)
    disp(elementS(i))
end 



