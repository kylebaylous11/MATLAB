%Name: Kyle Baylous SBU ID: 111374388
function [interest,X] = fn_interest(Xo,r,n,k)
%Calculates the interest paid on principal amount of $

X= Xo.*(1+r./k).^(k.*n);
interest= X-Xo;
end

