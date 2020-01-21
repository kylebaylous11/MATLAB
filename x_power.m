%x_power

n=input('Enter a positve integer for sequence number: ');
x=input('Enter x: ');

while n<0
    disp('Invalid')
    n=input('Enter a positve integer: ');
    x=input('Enter x: ');
end 

xindex=length(x);
for i=1:xindex
    y=x(i).^n;
    fprintf('The result of f(x)=x^%d for x=%d is %.2f\n',n,x(i),y)
end

%PLOT

