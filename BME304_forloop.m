%for loop practice

radius = 1:10;
%Radius = 1:10;

for i = 1:10
    if i>5
    Radius(i)=radius(i);
  
    end
    
end 

%Radius(Radius==0)=[];
Radius(1:5)=[];

numel(radius);


clc
