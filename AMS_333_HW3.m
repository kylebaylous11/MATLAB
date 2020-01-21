%AMS 333 HW 3
%Kyle Baylous
%SBU ID: 111374388



%PART A

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc; %Clear variables, clear command window
%%  Intraspecific competition
data1  = load('beetle_Rhizopertha_data.txt');  %Load Rhizopertha data
data2  = load('beetle_Oryzaephilus_data.txt');  %Load Oryzaephilus data
 
% Single-species growth alone, no interspecies interaction 
t1=data1(:,1);              %Load time
U1_data = data1(:,2);		%Load Rhizopertha population data

t2= data2(:,1);             %Load time
U2_data = data2(:,2);    	%Load Oryzaephilus population data

%% Plot data for each species growing alone
figure %Create new figure
subplot(2,1,1); %Create subplot 
plot(t1, U1_data,'ro-','LineWidth',1);    % Plot Rhizopertha data
%Title plot
title('Rhizopertha Population vs Time (Intraspecies Competition)','fontsize',14)
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Rhizopertha Population Size','fontsize',14) %Label y axis
legend('Rhizopertha Dominica Population Size','location','best') %Create legend
hold on

subplot(2,1,2); %Create subplot
plot(t2,U2_data,'bo-','LineWidth',1);  %Plot Oryzaephilus data
%Title plot
title('Oryzaephilus Population vs Time (Intraspecies Competition)','fontsize',14)
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Oryzaephilus Population Size','fontsize',14) %Label y axis
legend('Oryzaephilus Surinamensis Population Size','location','best') %Create legend
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART B

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data3 = load('beetle_Rhizo_Oryz_data.txt');  %Load interspecies competition data

%Interspecies competition
t3= data3(:,1);         	%Load time
U1_data3 = data3(:,2);  	%Load Rhizopertha Population data
U2_data3 = data3(:,3);  	%Load Oryzaephilus Population data
%% Interspecific Beetle competition
figure %Create figure
plot(t3, U1_data3,'ro-','LineWidth',1);   %Plot Rhizo population data
hold on
plot(t3, U2_data3,'bo-','LineWidth',1);  %Plot Oryz population data

%Title plot
title('Interspecies Competition Between Beetle Populations','fontsize',14)
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Beetle Population Size','fontsize',14) %Label y axis
%Create legend
legend('Rhizopertha Dominica Population','Oryzaephilus Surinamensis Population','location','best')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART C

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulating Interspecies Competition Model:

%Initial conditions  
global Ro1 Ro2 alpha beta k1 k2 %Make variables/parameters global

Ro1=0.051; %Per capita growth rate of species 1 (Rhizopertha Dominica)
Ro2=0.056; %Per capita growth rate of species 2 (Oryzaephilus Surinamensis)
k1=500; %Carrying capacity of species 1 (Rhizopertha Dominica)
k2=500; %Carrying capacity of species 2 (Oryzaephilus Surinamensis)
alpha=0.6; %Competition coefficient 
beta=0.31; %Competition coefficient

U1=U1_data3(1,1);   %Initial Rhizopertha population
U2=U2_data3(1,1);   %Initial Oryzaephilus population
U1U20 = [U1 U2]';   %Create initial data vector

tSpan = 0:300; %Using approximate max time from the data 

%% ** ODE solver **
[t,X] = ode45(@compet,tSpan,U1U20); %Use ode45 to simulate competition

%Plot the graphs of both the data and models together
figure %Create figure
subplot(2,1,1);
plot(t,X(:,1),'r-','LineWidth',1);   %Plot simulated Rhizopertha population model
title('Rhizopertha Population vs Time (Simulated)','fontsize',14)
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Rhizopertha Population Size','fontsize',14) %Label y axis
legend('Rhizopertha Dominica Population Size','location','best') 

hold on
subplot(2,1,2);
plot(t,X(:,2),'b-','LineWidth',1);  %Plot simulated Oryzaephilus population model
title('Oryzaephilus Population vs Time (Simulated)','fontsize',14)
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Oryzaephilus Population Size','fontsize',14) %Label y axis
legend('Oryzaephilus Surinamensis Population Size','location','best') %Create legend
hold off

figure %Create figure
plot(t,X(:,1),'g-','LineWidth',1);   %Plot simulated Rhizopertha population model
hold on
plot(t,X(:,2),'k-','LineWidth',1);  %Plot simulated Oryzaephilus population model

plot(t3,U1_data3,'ro-','LineWidth',1);   %Plot Rhizo population data
hold on
plot(t3,U2_data3,'bo-','LineWidth',1);  %Plot Oryz population data

title('Interspecies Competition Between Beetle Populations','fontsize',14) %Title plot
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Mixed Species Population Size','fontsize',14) %Label y axis
%Create legend
legend('Simulated Rhizopertha Population','Simulated Oryzaephilus Population', ...
    'Rhizopertha Population Data','Oryzaephilus Population Data','location','best')

hold off

figure
plot(X(:,1),X(:,2), 'r-','LineWidth',1);   % Plot both populations 
title('Interspecific Competition - Beetle Populations','fontsize',14)
xlabel('Population of Species 1 (Rhizopertha)','fontsize',14)
ylabel('Population of Species 2 (Oryzaephilus)','fontsize',14)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART D

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Velocity Field
xMin = 0;   %Set axes limits and spacing
xMax = 1800;
yMin = 0;
yMax = 900;
gWidth = 50;

range_U1 = xMin:gWidth:xMax; %Set ranges for meshgrid
range_U2 = yMin:gWidth:yMax;

[U1,U2]=meshgrid(range_U1, range_U2);   %Use meshgrid function
dU1dt = Ro1.*U1.*(1-(U1+alpha*U2)./k1); %Species 1
dU2dt=  Ro2.*U2.*(1-(U2+beta*U1)./k2);  %Species 2
L = sqrt(dU1dt.^2 + dU2dt.^2); %Normalization 
figure
quiver(U1,U2,dU1dt./L,dU2dt./L, 0.7,  'k-', 'LineWidth', 0.5) % plot 
hold on  

nc_U10 = 0*(ones(1,length(range_U1))); % U1 0 null_clines 
nc_U1 = k1-range_U2.*alpha;            % U1 null_clines 

nc_U20 = 0*(ones(1,length(range_U1))); % U2 0 null_clines 
nc_U2 = k2-range_U1.*beta;             % U2 null_clines 

plot(nc_U10,range_U1,'r--','LineWidth',2); % plot U1 0 null_cline
plot(nc_U1,range_U2,'r--','LineWidth',2);  % plot U1 null_cline
hold on  

plot(range_U1,nc_U20,'b-','LineWidth',2); % plot U2 0 null_cline
plot(range_U1,nc_U2,'b-','LineWidth',2);  % plot U2 null_cline

plot(0,0,'ro','LineWidth',2,'MarkerSize',10); %Plot equilibrium point 1
plot(0,k2,'ro','LineWidth',2,'MarkerSize',10); %Plot equilibrium point 2
plot(k1,0,'ro','LineWidth',2,'MarkerSize', 10); %Plot equilibrium point 3
eq_pt1 = (alpha*k2-k1)/(alpha*beta-1); %Get first coordinate for last eq. point
eq_pt2 = (beta*k1-k2)/(alpha*beta-1);  %Get last coordinate for last eq. point

plot(eq_pt1,eq_pt2,'ro','LineWidth',2,'MarkerSize',10); %Plot equilibrium point 4

axis([xMin xMax yMin yMax])

xlabel('Species 1 Population (Oryzaephilus)') %Label x-axis (Oryzaephilus)?
ylabel('Species 2 Population (Rhizopertha)') %Label y-axis (Rhizo)?
title('Cooperative Equilibrium of Beetle Populations') %Title the plot

%Create a legend
legend('Velocity Arrows','Nullcline', 'Nullcline', 'Nullcline',...
    'Nullcline','location', 'best')


hold off

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PART E

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Forward Euler Method

%AMS 333 HW 3, Euler Method
%Kyle Baylous SBU ID: 111374388

%clear all
%clc

%K=1000000; %Initialize the carrying capacity
%N = 10000; %Set the initial population size
%N_pop(1) = N; %Set the first element in N_pop array to N
%R0 = .14548533; %Growth rate

maxT = 300; %Set the max time for iterations using the Euler method

index = 0; %Initialize index variable to 0

%Use for loop to simulate model with Euler method with varying deltaTau
for deltaT = 2     %Use for loop to loop through various values for deltaT if needed
    U1_Euler_Count=U1_data3(1,1);
    U2_Euler_Count=U2_data3(1,1);%Initialize starting population upon each loop
    U1_Euler = zeros(1,1); %Initialize N_pop vector for each loop
    U2_Euler = zeros(1,1);
    t_vec = zeros(1,1); %Initialize t_vec vector for each loop
    U1_Euler(1) = U1_Euler_Count; %Initialize first N_pop element for each loop
    U2_Euler(1) = U2_Euler_Count;
    t_vec(1) = 0; %Initialize first t_vec element for each loop
    count = 1; %Initialize the count to 1
    index = index+1; %Increment the index variable upon each loop
    t = 0; %Initialize t variable to zero
while t<maxT %Use while loop to simulate the growth of the population
    t = t+deltaT;  % Update t
    U1_Euler_Count = U1_Euler_Count + ((Ro1.*U1_Euler_Count.*(1-((U1_Euler_Count+alpha*U2_Euler_Count)./k1))).*deltaT); %Species 1
    U2_Euler_Count = U2_Euler_Count + ((Ro2.*U2_Euler_Count.*(1-((U2_Euler_Count+beta*U1_Euler_Count)./k2))).*deltaT); %Species 2
    count = count+1; %Increment count
    U1_Euler(count) = U1_Euler_Count; %Store elements of N_pop
    U2_Euler(count) = U2_Euler_Count;
    t_vec(count) = t; %Store elements of t_vec
end
    figure
    subplot(2,1,1);
    plot(t_vec,U1_Euler,'r') %Plot the population versus time for each simulation
    title('Rhizopertha Population vs Time (Simulated)','fontsize',14)
    xlabel('Time (Days)','fontsize',14) %Label x axis
    ylabel('Rhizopertha Population Size','fontsize',14) %Label y axis
    legend('Rhizopertha Dominica Population Size','location','best') 
    hold on
    subplot(2,1,2);
    plot(t_vec,U2_Euler,'b')
    title('Oryzaephilus Population vs Time (Simulated)','fontsize',14)
    xlabel('Time (Days)','fontsize',14) %Label x axis
    ylabel('Oryzaephilus Population Size','fontsize',14) %Label y axis
    legend('Oryzaephilus Surinamensis Population Size','location','best') %Create legend
end 
hold off
%Forward Euler Simulation
%{
xlabel('Time (Days)') %Label x-axis
ylabel('Beetle Population') %Label y-axis
title('Beetle Population vs Time (Simulated)') %Title the plot
%Create legend
legend('Simulated Rhizopertha Population','Simulated Oryzaephilus Population','location','best')
%}
%Plotting species against one another

figure %Create figure
plot(U1_Euler,U2_Euler,'b'); %Plot populations versus one another
title('Interspecific Competition - Beetle Populations') %Title the plot
xlabel('Population of Species 1 (Rhizopertha)') %Label x-axis
ylabel('Population of Species 2 (Oryzaephilus)') %Label y-axis





%Plot results of ode45 function vs Forward Euler
figure

subplot(2,1,1);
plot(X(:,1),'b-','LineWidth',1);   %Plot simulated Rhizopertha population model
hold on
plot(t_vec,U1_Euler,'r','LineWidth',1)
title('Comparing Forward Euler and ode45 - Rhizopertha Population')
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Rhizopertha Population Size','fontsize',14) %Label y axis
legend('Rhizopertha Population - ode45','Rhizopertha Population - FEM' ,'location','best') 
hold off

subplot(2,1,2);
plot(X(:,2),'g-','LineWidth',1);  %Plot simulated Oryzaephilus population model
hold on
plot(t_vec,U2_Euler,'b','LineWidth',1)
title('Comparing Forward Euler and ode45 - Oryzaephilus Population')
xlabel('Time (Days)','fontsize',14) %Label x axis
ylabel('Oryzaephilus Population Size','fontsize',14) %Label y axis
legend('Oryzaephilus Population - ode45','Oryzaephilus Population - FEM' ,'location','best') 


hold off


%%%%%%%%%%%%%% PLOT ODE45s



%%%%%%%%%%%%%%



%Move function declaration to bottom of script for compatibility 

function dy = compet(t,y)
% Competition Model for Two Species
  global Ro1 Ro2 alpha beta k1 k2  
  dy=zeros(2,1);
    U1 = y(1);
    U2 = y(2);
dy(1)= Ro1.*U1.*(1-(U1+alpha*U2)./k1); %Species 1
dy(2)= Ro2.*U2.*(1-(U2+beta*U1)./k2); %Species 2
return
end



