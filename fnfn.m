function [approx]=fnfn(n)
sum=0;
for i=0:n
    sum=sum+((factorial(4*i)*(1103+26390*i))/((factorial(i))^(4)*396^(4*i)));
end
approx=((2*sqrt(2))/9801)*sum;


end 
