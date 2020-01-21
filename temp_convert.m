% Converts a temperature from C to F or K
cel = input('Enter the temp in degrees C: ');
choice = input('Do you want F or K? ', 's');
clear temperature;
switch choice
    case {'F','f'}
        temperature=fn_CelstoFahr(cel);
        fprintf('The temp in degrees F is %.1f\n',temperature)
    case {'K', 'k'}
        temperature=fn_CelstoKelv(cel);
        fprintf('The temp in degrees K is %.1f\n',temperature)
    otherwise
        disp('Unknown Units. Please re-enter')
end