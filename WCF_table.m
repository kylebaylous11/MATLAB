%This script prints a table for the WCF depending on temp. and wind speed
%Kyle Baylous SBU ID: 111374388
clear
clc

T=(-20:5:55);
V=(5:5:55);
tindex=length(T);
vindex=length(V);

A=zeros(tindex,vindex);

for i=1:tindex
    for j=1:vindex
        A(i,j)=fn_WCF(T(i),V(j)); 
    end
end

fprintf('Table of WCF\n')
fprintf('\t\t\tWind Speed (mph)\n')
fprintf('Temp(F) ')

for i=1:length(V)
   fprintf('%5.1f ',V(i))  
end 
fprintf('\n')
for i=1:length(T)
   
    fprintf('%7.1f ',T(i)) 
   
    for j=1:length(V)
       
        fprintf('%5.1f ',A(i,j))
    end
    fprintf('\n')
end



