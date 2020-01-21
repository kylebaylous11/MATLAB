%x=[-5 -3 -1 1 3 5];
%y=[10 8 3 8 4 5];

x=[62 65 59 63 69 63 60];
y=[2 6 1 4 6 1 3];

n=length(x);


q=(n*(sum(x.*y))-(sum(x)*sum(y)))/(n*(sum(x.^2))-(sum(x))^2);

display(q)

r=((sum(y))*(sum(x.^2))-(sum(x)*sum(x.*y)))/(n*(sum(x.^2))-(sum(x))^2);

display(r)

vec= zeros(1,n);
for i=1:n
    vec(i)=((q*x(i)+r)-y(i))^2;
   
    
end 

SSE=sum(vec);

display(SSE);
