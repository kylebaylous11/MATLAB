
function [mean]=fn_mean(vec)
%This function calculates the mean

vindex=length(vec);
sum=0;

for i=1:vindex
    sum=sum+vec(i);
end
mean=sum/vindex;
end 