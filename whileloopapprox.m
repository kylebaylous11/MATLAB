%practice
exact=1/exp(1); 

n=0;

approx=(1-1/n)^n;
eps=.0001;

while abs((approx-exact))>=eps
    n=n+1;
    approx=(1-1/n)^n;
end

disp(approx)
disp(n)