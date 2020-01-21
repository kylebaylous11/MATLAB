
D=[0 -1/7 -2/7; -1/5 0 -3/5; -1/4 -3/8 0];
b=[30/7;2;3/2];

x1=zeros(1,3);
sum=[100;100;100];
for i=1:40
    
    
    
    sum=D*sum+b;
    
    
     
    display(sum)
end 


