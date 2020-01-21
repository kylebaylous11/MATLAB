%Kyle Baylous SBU ID: 111374388
%This script converts wind speed from mph to knots and km/h
%Shows type/class of wind that user inputs from scale

wind=input('Please Enter The Wind Speed(mph): ');

[knots,kmh,rndknots]=fn_speedconv(wind);

if rndknots<0
    disp('Invalid Wind Speed')
else 
fprintf('The wind speed of %.2f mph is equal to %.2f knots\n', wind,knots)
fprintf('The wind speed of %.2f mph is equal to %.2f km/h\n', wind,kmh)
end 

if  rndknots>=0 && rndknots<= 1 
    disp('This strength of wind has a Scale Force of: 0')
    disp('This type of wind is classified as: Calm')
elseif rndknots>1 && rndknots<=3
    disp('This strength of wind has a Scale Force of: 1')
    disp('This type of wind is classified as: Light Air')
elseif rndknots>=4 && rndknots<=6
    disp('This strength of wind has a Scale Force of: 2')
    disp('This type of wind is classified as: Light Breeze')
elseif rndknots>=7 && rndknots<=10
    disp('This strength of wind has a Scale Force of: 3')
    disp('This type of wind is classified as: Gentle Breeze')
elseif rndknots>=11 && rndknots<=16
    disp('This strength of wind has a Scale Force of: 4')
    disp('This type of wind is classified as: Moderate Breeze')
elseif rndknots>=17 && rndknots<=21
    disp('This strength of wind has a Scale Force of: 5')
    disp('This type of wind is classified as: Fresh Breeze')
elseif rndknots>=22 && rndknots<=27
    disp('This strength of wind has a Scale Force of: 6')
    disp('This type of wind is classified as: Strong Breeze')
elseif rndknots>=28 && rndknots<=33
    disp('This strength of wind has a Scale Force of: 7')
    disp('This type of wind is classified as: Near Gale')
elseif rndknots>=34 && rndknots<=40
    disp('This strength of wind has a Scale Force of: 8')
    disp('This type of wind is classified as: Gale')
elseif rndknots>=41 && rndknots<=47
    disp('This strength of wind has a Scale Force of: 9')
    disp('This type of wind is classified as: Strong Gale')
elseif rndknots>=48 && rndknots<=55
    disp('This strength of wind has a Scale Force of: 10')
    disp('This type of wind is classified as: Storm')
elseif rndknots>=56 && rndknots<=63
    disp('This strength of wind has a Scale Force of: 11')
    disp('This type of wind is classified as: Violent Storm')
elseif rndknots>=64
    disp('This strength of wind has a Scale Force of: 12')
    disp('This type of wind is classified as: Hurricane')
else 
    disp('Error')
end

