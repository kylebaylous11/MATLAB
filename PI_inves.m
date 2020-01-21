%This script displays a menu for the user to investigate pi
%Kyle Baylous SBU ID: 111374388
 
%Call a function to display a menu and get a choice


choice=fn_PI_menu;

while choice~=3 
    switch choice
        case 1
            % Print result from Machin's formula
            fn_PI_Machin
        case 2
            % Approximate pi using Leibniz
            % Allow user to specify # of terms
            n=input('Please enter the amount of terms to approximate with: ');  

            approx=fn_PI_Leibnizn(n);
            
    end
%Display menu again and get user's choice 
choice=fn_PI_menu;
end