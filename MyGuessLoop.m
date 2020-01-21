%GuessNumber

disp('This is the game to guess my number from 0 to 10')
%fprintf('This is the game to find the integer from 0 to 10\n')

guess=randi([0 10]); 
myguess=input('What is your guess?: ');
count=1; %first input count as 1 for this script while ~any(myguess==guess)
while ~any(myguess==guess)
myguess = input('Incorrect! What is your guess? ');
count=count+1; %counting how many entered end
end
fprintf('Right! My number is %d.\n', guess)
fprintf('You entered %d times to hit the number!\n',count)
