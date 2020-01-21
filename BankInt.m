%Name: Kyle Baylous SBU ID: 111374388
%This script calculates interest on a principal amount of $

Xo=input('Please enter the principal amount: '); 
r=input('Please enter the interest rate(%): ')/100;
n=input('Please enter the term of year: ');
k=input('Please enter amount of times compounded in a year: ');

[I,X]=fn_interest(Xo,r,n,k);

fprintf('The principal amount of $%.2f in %.1f years with an ',Xo,n)
fprintf('interest rate of %.2f%% ',r*100) 
fprintf('becomes $%.2f when the interest is compounded %.1f times a year.\n',X,k)
fprintf('Your earning amount is: $%.2f\n',I)  
