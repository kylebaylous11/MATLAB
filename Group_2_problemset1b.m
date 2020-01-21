%This file contains the functions needed to run the problem set 1b script
%Group 2    Problem set 1b: Function file

function [time, Conarray] = Group_2_problemset1b(t_final,timestep,LacI,IPTG,betagalac)  %(i)
%This function solves a system of coupled ODEs using MATLAB ode15s solver
%Inputs: t_final --> final time parameter, timestep --> change in time                  %(i)
%Inputs: LacI, IPTG, betagalac --> initial concentrations of LacI,                      %(i)
%IPTG and beta-galactosidase
%Outputs: time --> time parameter, Conarray --> concentration array of                  %(i)
%molecules LacI, IPTG and beta-galactosidase

%Allows for a relative error of 1*10^-6, use odeset function
opt = odeset('RelTol',1*10^-6);                                                           %(i)

%Solve the ODEs over a time period of 0 to 24, using the equations below                %(iv)
%and the initial concentrations of LacI, IPTG and beta-galactosidase
[time, Conarray] = ode15s(@ODEqus,0:timestep:t_final,[LacI, IPTG, betagalac],opt);      %(i)
%time --> time variable output                                                          %(i)
%Conarray --> concentration array for LacI, IPTG, betagalac                             %(i)
end

function [odesol] = ODEqus(time, y)                                                       %(i)
%ODEqus is the function handle for the function that contains the ODE equations
%time --> time input variable for function                                              %(i)
%y --> parameter input for ODEs for evaluation 

%Define constants used in the ODEs, shown below
%Make them global so that they are compatitble between scripts/functions
%Global variables are not limited by scope

global... 
a... %Reaction rate constant of LacI repressor
theta ... %Kinetic constant of LacI repressor 
n... %Kinetic coefficient of LacI repression
b... %Reaction rate constant of IPTG binding
g... %Reaction rate constant of protein degradation 
C... %Extracellular IPTG concentration
f... %Reaction rate constant of outbound membrane transport 
c... %Reaction rate constant of inbound membrane transport 
l... %Reaction rate of basal gene expression
    
%Create array to store the concentrations of LacI, IPTG and betagalac
odesol = zeros(3,1);                                                                   %(i)
    
%Differential equations for the negative feedback gene circuit model
    odesol(1) = a*(theta^n/(theta^n+y(1)^n)) - b*y(1)*y(2) - g*y(1); %LacI             %(i,ii)
    odesol(2) = c*C - b*y(1)*y(2) - g*y(2) - f*y(2); %IPTG                             %(i,ii)
    odesol(3) = a*(theta^n/(theta^n+y(1)^n)) + l - g*y(3); %CI::LacZ                   %(i,ii)
    
    %y(1) is the LacI protein concentration
    %y(2) is the Intracellular IPTG concentration
    %y(3) is the CI::LacZ concentration
end




