%Kyle Baylous SBU ID: 111374388
%This function converts mph to knots and km/h
%This function also rounds the value for knots
function [knots,kmh,rndknots]=fn_speedconv(wind)

knots=wind./1.152;
kmh=wind.*1.609;
rndknots=round(knots);

end

