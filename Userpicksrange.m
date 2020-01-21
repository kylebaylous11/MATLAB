%GuessNumber

disp('This is the game to guess my number in a certain range')
%fprintf('This is the game to find the integer from min to max\n')


min=input('Enter the minimum of the range: ');
max=input('Enter the maximum of the range: ');
guess=randi([min max]); 
myguess=input('What is your guess?: ');
count=1; %first input count as 1 for this script while ~any(myguess==guess)


while ~any(myguess==guess)
myguess = input('Incorrect! What is your guess? ');
count=count+1; %counting how many entered end
end
fprintf('Right! My number is %d.\n', guess)
fprintf('You entered %d times to hit the number!\n',count)
