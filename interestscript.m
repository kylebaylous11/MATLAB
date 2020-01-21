%This script calculates interest 

A=input('Please enter the principal amount: ');
r=input('Please enter the interest rate as a decimal: ');
n=input('Please enter the term of year: ');
k=input('Please enter amount of times compounded in a year: ');

P=A*(1+r/k)^(k*n);
interest=fn_interest(P,A);

fprintf('The principal amount of $%.2f in %.2f years with an ',A,n)
fprintf('interest rate of %.2f ',r) 
fprintf('becomes $%.2f when the interest is compounded %.2f times a year.\n',P,k)
fprintf('Your earning amount is: $%.2f\n',interest)  
