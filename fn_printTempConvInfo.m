function fn_printTempConvInfo
% Prints some info on temperature conversions
% Format of call: printTempConvInfo
% or printTempConvInfo()
% Does not return any values
fprintf('There are different temperature scales.\n')
fprintf('For given a temperature in Fahrenheit,\n')
fprintf(' the conversion to Celsius is C = (F - 32)*5/9\n')
fprintf('For given a temperature in Celsius,\n')
fprintf(' the conversion to Fahrenheit is F = C*9/5 + 32\n')
fprintf('Kelvin is K = C + 273.15.\n ')
end