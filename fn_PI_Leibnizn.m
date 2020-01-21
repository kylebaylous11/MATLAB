%Kyle Baylous SBU ID: 111374388
function [approximation]=fn_PI_Leibnizn(n)
%This function approximates pi with n amount of terms that user picks


%Check to see if the input is a positive integer
while n<=0 || rem(n,1)~=0
    disp('Invalid! The amount of terms must be a positive integer.')
    n=input('Please enter the amount of terms to approximate with: ');
end

%Preallocate for the approximation
apprxvec=zeros(1,n);
%Find the terms for the series
for i=1:n
    apprx=4*((-1).^(1+i)./(2.*i-1));
    apprxvec(i)=apprx;     
end
%Find the sum of the series up to n terms 
approximation=sum(apprxvec);
fprintf('With %d terms, the approximation for pi is %.5f\n',n,approximation)
end

