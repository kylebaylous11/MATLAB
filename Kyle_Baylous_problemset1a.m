%Kyle Baylous   SBU ID:111374388
%This script is written for executing Problem Set 1a steps

clear %Clear workspace for the script to run accurately 

%Step 1
time = (0:.25:25);  %Create time array from 0s to 25s with .25s steps

%Step 2
M = 6.78.*cos((pi/2).*time).*exp(-.21.*time)+25.4; 
%Create protein concentration array as a function of time according to
%the given equation in step 2

%Step 3
plot(time,M,'g--') %Use plot function to plot concentration (mM) vs time (s)
%The curve will be green and will have a dash-dot line

%Step 4
hold on %Use hold on to plot the trendline next

T = 6.78.*exp(-.21.*time)+25.4; %Create line of best fit (trendline) 
%according to the given equation in step 4

plot(time,T,'g--') %Use plot function to plot the trendline
%The curve will be green and will have a dash-dot line

hold off %Turn off hold since plotting is complete

%Step 5
title('Protein Concentration (mM) vs Time (s)') %Use title function to create
%the plot title

xlabel('Time (s)') %Use xlabel function to label x axis

ylabel('Protein Concentration (mM)') %Use ylabel function to label y axis

legend('Protein Concentration Change', 'Line of Best Fit') 
%Use legend function to create a legend for the figure 

grid on %Turn plot grid on

%Step 6 is included in the plotting of the curves previously in the script

%Step 7
n = numel(M); %Store size of M array in variable n
separray = zeros(1,n); %Initialize an array of zeros to add time values to

for i = 1:n %Create for loop to go through the elements of array M
    if M(i) < 24.8 %Use if statement to find indices of M where M < 24.8 mM
        separray(i) = time(i); %Find corresponding time elements and store 
                               %in a separate array
    end %End the if statement
    
end %End the for loop
         
separray(separray==0)=[]; 
%Eliminate any remaining zeros in array by using logic operator == and 
%the empty brackets []

%Step 8
counttime = numel(separray); %Store size of separray in variable counttime 

timeratio = counttime/numel(time); %Find time ratio by using division /

%Step 9
fprintf('The ratio is %f. \n',timeratio)
%Use fprintf to print the ratio of time to the command window




