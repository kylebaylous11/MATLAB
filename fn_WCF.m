%Kyle Baylous SBU ID: 111374388

function [wcf] = fn_WCF(T,V)
%This function uses temp. and wind speed values to find the WCF
wcf=35.7+(.6.*T)-(35.7.*V.^(.16))+(.43.*T.*V.^(.16)); 

end

