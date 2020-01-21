%AMS 333 HW 2, Second Part: Logistic Equation
%Kyle Baylous SBU ID: 111374388

 data = load('squirrel_data.txt'); %Load in the data
 
 t=data(:,1); %Store the time data in variable t
 pop=data(:,2); %Store the population data in variable pop
 
 K=1000000; %Initialize the carrying capacity
 N0 = 10000; %Set the initial population size
 R0 = .14548533; %Set the growth rate value
 t = t-1980; %Get time starting from t=0
 
 for i= 1:length(t) %Use for loop to compute population for every time point
 
     Nt(i) = (N0*K)./(N0 + (K-N0).*exp(-R0.*(i-1)));
     %Function N(t) used for modeling the population with the logistic equation
 
 end

 
 ident=ones(1,40); %Create array of ones to help create horizontal steady states
 N1_steady = 0.*ident; %Create N1 steady state array
 N2_steady = K.*ident; %Create N2 steady state array
 
 figure(1) %Create figure 1
 plot(t,pop,'bo') %Plot population versus time
 
 ylim([0 1200000]) %Set the y-axis limits
 
 xlabel('Time (Years)') %Label the x-axis
 ylabel('Grey Squirrel Population Size') %Label the y-axis
 title('Grey Squirrel Population vs Time') %Create a title for the plot
 
 hold on
 
 plot(t,Nt,'k') %Plot the logistic growth model
 
 plot(t, N1_steady,'m') %Plot the steady states
 
 plot(t, N2_steady,'r') %Plot the steady states
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure(2) %Plot additional 10 years in new figure, until 2029
 
 newt = 0:49; %Create new time array
 
 for i= 1:length(newt) %Compute the population again with an additional 10 years
 
     Nt(i) = (N0*K)./(N0 + (K-N0).*exp(-R0.*(i-1)));
     %Function N(t) used for modeling the population with the logistic equation
 
 end
 
 ident=ones(1,50); %Create array of ones to help create horizontal steady states
 N1_steady = 0.*ident; %Create N1 steady state array
 N2_steady = K.*ident; %Create N2 steady state array
 
 plot(t,pop,'bo') %Plot population versus time
 
 ylim([0 1200000]) %Set y-axis limits
 
 xlabel('Time (Years)') %Label x-axis
 ylabel('Grey Squirrel Population Size') %Label y-axis
 title('Grey Squirrel Population vs Time') %Create title for plot
 
 hold on
 
 plot(newt,Nt,'k') %Plot the logistic growth model
 
 plot(newt, N1_steady,'m') %Plot the steady states
 
 plot(newt, N2_steady,'r') %Plot the steady states
 
 
 
 
 
 
 