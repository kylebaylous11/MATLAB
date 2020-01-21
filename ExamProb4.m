%This script plots the result from our function fn_exam

x=input('Please enter the values for x: ');
%prompt
y=fn_practice(x);
%call
plot(x,y,'go') %plot
xlabel('x')
ylabel('y')%label
title('Kyle')