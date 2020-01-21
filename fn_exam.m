function [y] = fn_exam(x)
%This function calculates f(x) depending on the value of x

y=zeros(1,length(x));
%iterate through each term
for i=1:length(x)
    %determine what elements of x are -2,0, or neither
    switch x(i)
        case 0 
        y(i)=0;
        case -2
        y(i)=0;
        otherwise %calculate
        y(i)=(1./(x(i).^2+2.*x(i)));
    end 
    
end

end

