%AMS 333 HW 2, Third Part: Euler Method
%Kyle Baylous SBU ID: 111374388

clear all
clc

K=1000000; %Initialize the carrying capacity
N = 10000; %Set the initial population size
N_pop(1) = N; %Set the first element in N_pop array to N
R0 = .14548533; %Growth rate

maxT = 60; %Set the max time for iterations using the Euler method

index = 0; %Initialize index variable to 0

%Use for loop to simulate model with Euler method with varying deltaTau
for deltaT = .1:10 %Loop through various values for deltaT
    N = 10000; %Initialize starting population upon each loop
    N_pop = zeros(1,1); %Initialize N_pop vector for each loop
    t_vec = zeros(1,1); %Initialize t_vec vector for each loop
    N_pop(1) = N; %Initialize first N_pop element for each loop
    t_vec(1) = 0; %Initialize first t_vec element for each loop
    count = 1; %Initialize the count to 1
    index = index+1; %Increment the index variable upon each loop
    t = 0; %Initialize t variable to zero
while t<maxT %Use while loop to simulate the growth of the population
    t = t+deltaT;  % Update t
    N = N+(((R0*N)*(1-(N/K)))*deltaT); % Update N
    count = count+1; %Increment count
    N_pop(count) = N; %Store elements of N_pop
    t_vec(count) = t; %Store elements of t_vec
end
    plot(t_vec,N_pop) %Plot the population versus time for each simulation
    hold on    
end 

ylim([0 1200000]) %Set y-axis limits

xlabel('Time (Years)') %Label x-axis
ylabel('Grey Squirrel Population') %Label y-axis
title('Grey Squirrel Population vs Time') %Title the plot


