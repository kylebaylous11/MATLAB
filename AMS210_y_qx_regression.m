x=[2 4 6 8 10 12];
y=[10 8 3 8 4 5];

q=.64;

vec= zeros(1,6);

for i=1:6
    vec(i)=(q*x(i)-y(i))^2;
   
    
end 

answer=sum(vec);