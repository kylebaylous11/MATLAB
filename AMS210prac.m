D=[.3 .2 ; .4 .2];
identity=[1 0; 0 1];
sum=zeros(2);

for i=1:100
    

    
    sum=sum+D.^i;
   
    
end

display(sum+identity)