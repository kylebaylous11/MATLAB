function outvec = fn_checkInteger
% This function prompts the user for n
% It error-checks to make sure n is a positive integer
% It returns a vector from 1 to n
% Format of call: promptNVec or promptNVec()
% Returns a vector 1:n
inputnum = input('Enter a positive integer for n: ');
num2 = int32(inputnum);
while num2 ~= inputnum || num2 < 0
inputnum = input('Invalid! Enter a positive integer: ');
num2 = int32(inputnum);
end
outvec = inputnum;
end