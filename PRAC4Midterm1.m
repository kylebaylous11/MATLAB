C1=randi([1,10]);
C2=randi([1,10]);
C3=randi([1,10]);

fprintf('There are %d tracks on CD 1.\n',C1)
fprintf('There are %d tracks on CD 2.\n',C2)
fprintf('There are %d tracks on CD 3.\n',C3)
    
choiceCD=input('What is your favorite CD? Enter: ');
while choiceCD<1 || choiceCD>3
    disp('Invalid')
    choiceCD=input('What is your favorite CD? Enter: ');
end 
choiceTrack=input('What is your favorite track? Enter: ');

if choiceCD==1
    while choiceTrack<1 || choiceTrack>C1
        disp('Invalid')
        choiceTrack=input('What is your favorite track? Enter: ');
    end
    
elseif choiceCD==2
     while choiceTrack<1 || choiceTrack>C2
        disp('Invalid')
        choiceTrack=input('What is your favorite track? Enter: ');
     end
     
elseif choiceCD==3
     while choiceTrack<1 || choiceTrack>C3
        disp('Invalid')
        choiceTrack=input('What is your favorite track? Enter: ');
     end
     
end




        