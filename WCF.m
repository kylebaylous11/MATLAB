%This script uses a function to calculate WCF and shows other details
%Kyle Baylous SBU ID: 111374388

T=input('Please enter the temperature in Fahrenheit: ');
V=input('Please enter the wind speed in mph: ');

disp('Are you sure that your units are correct?')
choice=input('Enter 1 for Yes or 2 for No: ');

if choice~=1 && choice~=2
        disp('Invalid Selection!')
        choice=input('Enter 1 for Yes or 2 for No: ');
end
 

while choice==2
    disp('Please enter the temperature and wind speed with correct units.')
    T=input('Please enter the temperature in Fahrenheit: ');
    V=input('Please enter the wind speed in mph: ');
    disp('Are you sure that your units are correct?')
    choice=input('Enter 1 for Yes or 2 for No: ');
    
    if choice~=1 && choice~=2
        disp('Invalid Selection!')
        choice=input('Enter 1 for Yes or 2 for No: ');
    end
 
end

while T>=50||V<=3
    disp('Please enter a valid temperature and wind speed.')
    T=input('Please enter the temperature in Fahrenheit: ');
    V=input('Please enter the wind speed in mph: ');
end


[wcf]=fn_WCF(T,V);

fprintf('With a temperature of %.2f degrees and a wind speed of',T)
fprintf(' %.2f mph, it feels like %.2f degrees outside.\n',V,wcf)

if wcf>-20
    disp('NO frostbite warning')
elseif wcf>-35 && wcf<=-20
    disp('Skin can freeze in 30 minutes')
elseif wcf>-50 && wcf<=-35
    disp('Skin can freeze in 10 minutes')
elseif wcf<=-50
    disp('Skin can freeze in 5 minutes')
else
    disp('Invalid input')
end 



