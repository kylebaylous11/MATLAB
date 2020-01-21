%example script

a=input('enter a number: ');

aa=a;
count=0;

while a>1
    a=a/2; 
    count=count+1;
end 

fprintf('The number %2d can be divided by 2 for %2d times\n',aa,count) 
fprintf('before the answer becomes less than or equal to 1.\n')
    