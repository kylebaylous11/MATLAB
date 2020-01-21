%This script includes code that creates a cell that stores the element
%name, symbol, number, and mass of periodic table elements up to Neon
%Kyle Baylous SBU ID:111374388

clear elementC
%Create cell array 
elementC=cell(0,4); 
elementC{1,1}=char('Hydrogen','Helium','Lithium','Beryllium','Boron','Carbon',...
    'Nitrogen','Oxygen','Fluorine','Neon');
elementC{1,2}=char('H','He','Li','Be','B','C','N','O','F','Ne');
elementC{1,3}=[1;2;3;4;5;6;7;8;9;10];
elementC{1,4}=[1.0079;4.0026;6.9410;9.0122;10.8110;12.0110;14.0070;15.9990;18.9980;20.1800];
%display the cell array
celldisp(elementC)
%Prompt user to enter element number to display information
n=input('Please input the element number you wish to see info for: ');

for i=1:length(n)
    
    fprintf('The element with atomic number %d is %s\n',n(i),elementC{1}(n(i),:))
    fprintf('This element has the symbol %s and mass number %.3f\n',elementC{2}(n(i)),elementC{4}(n(i)))
    fprintf('\n')
    
end




