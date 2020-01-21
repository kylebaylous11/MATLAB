%This script calculates how many term it takes for any random 2 integers
%to become the golden ratio based on method 5
%Kyle Baylous   SBU ID: 111374388
clear

limit=input('Enter a number limit to find random integers: '); %Let user choose randi arugment

while limit<0
    disp('Invalid')
    limit=input('Enter a number limit to find random integers: ');
end 

a=randi(limit); %Calculate random integers
b=randi(limit);
initiala=a; %Save initial values in variables
initialb=b;
if a<b %Error checking for a<b
    c=b; 
    b=a;
    a=c;
end 

N=5; 
tolerance=10^-N; %Set tolerance 
count=0; %Initialize count 
phi=fn_GoldenRatio; %Use function for initial phi value
fprintf('\n')

while abs(a/b-phi)>=tolerance %Find the ratio within the tolerance zone
c=a; %If first ratio doesn't work, keep looping through other values of a and b
a=a+b; %a becomes the addition of the previous two 
b=c; %b becomes the previous value of a, where c is just a temporary variable
count=count+1; %Increment count each time the terms are looped through 
end 
   
PHI=a/b; %Set final value for phi
fprintf('For ratio numbers %d and %d, it took %d iterations to get\n',initiala,initialb,count) %Display 
fprintf('within a tolerance zone of %.5f.\n',tolerance)
