%Kyle Baylous
%SBU ID: 111374388
%AMS 333 HW 4: MATLAB Code 

clc; clear all;
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
    title('Infected Population Density vs Time')
    xlabel('Time (Weeks)','fontsize',16)
    ylabel('Infected population (Density)','fontsize',16);
    legend({'Data of H1N1 cases', 'Model fit to data'},'FontSize',16);
set(gca, 'LooseInset', get(gca, 'TightInset'));
%print('-r300','-depsc2',['fig_sir_data_model','.eps']);   
%print('-r300','-dpng',  ['fig_sir_data_model','.png']);  
%print('-r300','-djpeg', ['fig_sir_data_model','.jpg']);  
figure
plot(t,P,'or','LineWidth',1.5);
    title('Infected Population Density vs Time')
    xlabel('Time (Weeks)','fontsize',16)
    ylabel('Infected population (Density)','fontsize',16);
    %legend({'Data of H1N1 cases', 'Model fit to data'},'FontSize',16);
set(gca, 'LooseInset', get(gca, 'TightInset'));

%% SIR plot model
%% Intial Parameters
global t gamma beta Ro
S0=7000;             % Initial Susceptible population
I0=10;                % Initial Infected population 
R0=0;                % Initial Recovered population 
SIR0 = [S0 I0 R0]';
%% Parameters
gamma=0.7*2;         % Recovery or removal rate
Ro=1.45;               % Basic Reproductive Number(ratio)
beta=Ro*gamma       % Transmission probability
h = 0.001;          % time steps

tSpan = 0:h:length(tt)+20; % set time interval

hold on
[t,X] = ode45(@sir_model,tSpan,SIR0); 

plot(t,X(:,2),'Color','blue','LineWidth',1.2);         
    xlabel('Time (Weeks)','fontsize',16)
    ylabel('Infected population (Density)','fontsize',16);
    %ylim([0 2500])
    %xlim([0 35])
    legend({'Data of H1N1 cases', 'Model fit to data'},'FontSize',16);

set(gca, 'LooseInset', get(gca, 'TightInset'));
%print('-r300','-depsc2', '-loose',['fig_sir_data_model','.eps']);   
%print('-r300','-dpng',  ['fig_sir_data_model','.png']);  
%print('-r300','-djpeg', ['fig_sir_data_model','.jpg']);


TFinal=length(tSpan);  % Final Time
SFinal=X(TFinal,1)  % Final Susceptible population 
IFinal=X(TFinal,2)  % Final Infected population  
RFinal=X(TFinal,3)  % Final Recovered population  

R_Final_Died=X(TFinal,3)*(0.12/100)  % Percent of infected population that died
I_Max=max(X(:,2))             % Maximum Infected population  

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