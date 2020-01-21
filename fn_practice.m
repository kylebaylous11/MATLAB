function fx=fn_practice(x)
%Explain
%now...
xindex=length(x);
fx=zeros(1,xindex);

for i=1:xindex
    switch x(i)
        case {-2,0}
            fx(i)=0;
        otherwise 
            fx(i)=1/((x(i)^2)+2*x(i)); 
    end 
end 


end 




