function [phi]=fn_GoldenRatio
%This function calculates the golden ratio using method 3
%   This function is used in the findgoldenratio script
%Kyle Baylous   SBU ID: 111374388
clear

disp('Let''s find an initial value for phi to use as the default phi') 
a=input('Please enter a number between 0 and 1: '); %intitial set-up with any number between 0 to 1
while a<0 || a>1 %Error checking
    disp('Invalid')
    a=input('Please enter a number between 0 and 1: ');
end 

N=input('Please enter the decimal place precision: '); %Let user choose precision 

b=a; %First let a and b be equal 
tol=10^-N; %Set increment 
ratio1=a/b; %Calculate ratios 1 and 2
ratio2=(a+b)/a;

while round(ratio1,N)~=round(ratio2,N) %precise rounding
    a=a+tol;
    ratio1=a/b;
    ratio2=(a+b)/a;
end
    phi=ratio1;
    fprintf('The Golden Ratio used for initialization is %.4f\n',phi)
    
    
