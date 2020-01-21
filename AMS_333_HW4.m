%AMS 333 HW 4
%Kyle Baylous
%SBU ID: 111374388


clf; clc; clear memory; clear all; close all
clf; clc; clear memory; clear all; clc; close all
set(0,'DefaultTextFontname', 'Arial','DefaultAxesFontSize', 12) 
set(gca, 'FontName', 'Arial','DefaultTextFontSize', 12)

%% Fitting Data to a Logistic Model: Flu data
data = load('data_flu_2009.txt');
%% extract the semi-major axis from the first column of  data
tt=data(:,1);
% % extract the period from the second column of data
P = data(:,2); 
%% Time span
t=1:1:length(tt);
%% Plot Data
figure
plot(t,P,'or','LineWidth',1.5);
    xlabel('Time(days)','fontsize',16)
    ylabel('Infected population(Density)','fontsize',16);
    legend({'Data of cases', 'Model fit to data'},'FontSize',16);
set(gca, 'LooseInset', get(gca, 'TightInset'));
%print('-r300','-depsc2',['fig_sir_data_model','.eps']);   
%print('-r300','-dpng',  ['fig_sir_data_model','.png']);  
%print('-r300','-djpeg', ['fig_sir_data_model','.jpg']);
figure
plot(t,P,'or','LineWidth',1.5);
    xlabel('Time(days)','fontsize',16)
    ylabel('Infected population(Density)','fontsize',16);
    legend({'Data of cases', 'Model fit to data'},'FontSize',16);
set(gca, 'LooseInset', get(gca, 'TightInset'));

%% SIR plot model
%% Intial Parameters
global t gamma beta Ro
S0=7000;             % Initial Susceptible population..S0=3000; 
I0=10;                % Initial Infected population 
R0=0;                % Initial Recovered population 
SIR0 = [S0 I0 R0]';
%% Parameters
gamma=0.7;         % Recovery or removal rate...gamma=0.35;
Ro=1.45;               % Basic Reproductive Number(ratio)
beta=Ro*gamma       % Transmission probability
h = 0.001;          % time steps...h = 0.005;

tSpan = 0:h:length(tt); % set time interval

hold on
[t,X] = ode45(@sir_model,tSpan,SIR0); 

plot(t,X(:,2),'Color','blue','LineWidth',1.2);         
    xlabel('Time(days)','fontsize',16)
    ylabel('Infected population(Density)','fontsize',16);
    legend({'Data of cases', 'Model fit to data'},'FontSize',16);

set(gca, 'LooseInset', get(gca, 'TightInset'));
%print('-r300','-depsc2', '-loose',['fig_sir_data_model','.eps']);   
%print('-r300','-dpng',  ['fig_sir_data_model','.png']);  
%print('-r300','-djpeg', ['fig_sir_data_model','.jpg']);  

%%
function dy = sir_model(t,y)
% Susceptible-Infected Model 
global beta gamma 
  dy=zeros(3,1);
    S = y(1);
    I = y(2);
    R = y(3);
    N=S+I+R;
dy(1)= -beta.*S.*I./N;              %Susceptible
dy(2)= beta.*S.*I./N-gamma.*I;      %Infected
dy(3)= gamma.*I;                    %Recovered
return
end


















%{
clc; clear all;

global t K r N0 T
% Fitting Data to a Logistic Model: flu data
data = load('data_flu_2009.txt');
% 
%% extract the semi-major axis from the first column of  data
tt=data(:,1);
% % extract the period from the second column of data
P = data(:,2); 
%%
t=1:1:length(tt);
%% Plot Data (# infected cases vs weeks)
figure
plot(t,P,'o-');
title('Number of Infected Cases Versus Time')
xlabel('Time (Weeks)')
ylabel('Infected Cases (Number)') 

figure
plot(t,P,'o');
title('Number of Infected Cases Versus Time')
xlabel('Time (Weeks)')
ylabel('Infected Cases (Number)') 
%% SIR plot model
%% Parameters
global gamma beta  
S0=7000;           % Initial Susceptible population
I0=10;             % Initial Infected population 
R0=0;              % Initial Recovered population 
SIR0 =[S0 I0 R0]'; % Initial
%% Parameters
Ro = 1.44; %Use Ro=1.45 for first part, then use 2.9, then 
gamma=0.6999; %For flu model, 1/gamma = 1.4286, for first part, gamma = 0.7
beta=Ro*gamma %beta = 1.015 works well...Ro*gamma
h = 0.001; % time step
tSpan = 0:h:length(tt);               % set time interval
hold on
[t,X] = ode45(@sir_model,tSpan,SIR0); 

%figure
plot(t,X(:,2),'Color','blue','LineWidth',1.2);         
xlabel('Time (Weeks)','fontsize',14)
ylabel('Infected Host Density','fontsize',14);
hold off

%Plotting other curves
%{
figure
plot(t,X(:,1),'Color','blue','LineWidth',1.2);         
hold on

plot(t,X(:,2),'Color','red','LineWidth',1.2);         

plot(t,X(:,3),'Color','green','LineWidth',1.2);         
xlabel('Time (Weeks)','fontsize',14)
ylabel('Infected Host Density','fontsize',14);
%}

%%%%


function dy = sir_model(t,y)
% Susceptible-Infected Model 
  global beta gamma 
  dy=zeros(3,1);
    S = y(1);
    I = y(2);
    R = y(3);
    N = S+I+R;
dy(1)=  -beta.*S.*(I./N);          %Susceptible
dy(2)=  beta.*S.*(I./N)-gamma.*I;          %Infected
dy(3)=  gamma.*I;          %Recovered
return
end




%}


