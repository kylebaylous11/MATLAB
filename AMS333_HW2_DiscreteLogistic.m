%AMS 333 HW 2, Fourth Part: Discrete Logistic Equation
%Kyle Baylous SBU ID: 111374388

clear all

numIterations = 50; %Set number of iterations 
t = 0:numIterations; %Create t vector
N = zeros(size(t)); %Initialize N vector
N(1) = 0.25; %Store 0.25 as first element in N vector

for r=.8:1.8 %Use for loop to loop through both values of r
    
for i=1:numIterations %Use nested for loop to solve for N(i) with each r value
  N(i+1) = (r.*N(i)).*(1-(N(i))); %Solve N(i+1) for each iteration
end

plot(t,N,'-o'); %Plot N versus t
hold on
end
hold off

xlabel('t') %Label x-axis
ylabel('N') %Label y-axis

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
%For varying the values of r 

numIterations = 50; %Set number of iterations
t = 0:numIterations; %Create t vector

r = [2.5,2.8,3.2,3.5,3.56,3.83]; %Create r array for plotting 

count = 0; %Initialize count
for k=1:length(r) %Use outer for loop to loop through r values
    count = count + 1; %Increment count for each loop
    R = r(k); %Store r value in R array
    N = zeros(size(t)); %Initialize N vector for each loop
    N(1) = 0.25; %Set the first element of N to 0.25
for i=1:numIterations %Use nested for loop to iterate through discrete equation
  N(i+1) = (R.*N(i)).*(1-(N(i)));
end

subplot(3,2,count), plot(t,N,'-o'); %Create subplots, plot N versus t
xlabel('t') %Label x-axis
ylabel('N') %Label y-axis

title_name = sprintf('r = %f',r(k)); %Title the plots
title(title_name)
hold on
end

hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%For r = 3.87

clear all

numIterations = 50; %Set number of iterations
t = 0:numIterations; %Initialize t array
N = zeros(size(t)); %Initialize N array
N(1) = 0.25; %store 0.25 in the first element of N

r = 3.87; %Set r to equal 3.87 now

for i=1:numIterations %Use for loop to compute iterations of equation
  N(i+1) = (r.*N(i)).*(1-(N(i)));
end

plot(t,N,'-o'); %Plot N versus t
xlabel('t') %Label x-axis
ylabel('N') %Label y-axis

