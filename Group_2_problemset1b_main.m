%This script contains the code needed to run the analysis problem set 1b 
%Group 2    Problem set 1b: Main script file

clc; clear all; 
%Clear workspace, command window

tic %start timer for simulation

%Parameters for the gene circuit according to research findings/reports 
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

%Define the global variables

a=7*10^9;                                                                           %(iii)
%Source:Riggs AD, Bourgeois S, Cohn M. The lac repressor-operator interaction. 3. 
%Kinetic studies. J Mol Biol. 1970 Nov 1453(3):401-17 
%p.412 2nd paragraph and p.415 bottom paragraph

theta=1*10^5;                                                                       %(iii)        
%Source: Fried M, Crothers DM. Equilibria and kinetics of lac repressor-operator 
%interactions by polyacrylamide gel electrophoresis. Nucleic Acids Res. 1981;9(23):6505-25.

n=2;                                                                                %(iii)
%Source: http://2007.igem.org/wiki/index.php/ETHZ/Parameters

b=4.6*10^4;                                                                         %(iii)  
%Source: Dunaway, M., Olson, J. S., Rosenberg, J. M., Kallai, 
%O. B., Dickerson, R. E., & Matthews, K. S. (1980). 
%Kinetic studies of inducer binding to lac repressor. operator complex. 
%Journal of Biological Chemistry, 255(21), 10115-10119.

g=1.4*10^-3;                                                                        %(iii)
%Süel, G. M., Garcia-Ojalvo, J., Liberman, L. M., & Elowitz, M. B. (2006). 
%An excitable gene regulatory circuit induces transient cellular differentiation. 
%Nature, 440(7083), 545.

f=300;                                                                              %(iii)
%Source: Gennis, R. B. Biomembranes: Molecular Structure and Function. 
%Springer-Verlag, N.Y. 1989 p.274 table 8.3

c=1*10^7;                                                                           %(iii)
%Source: Katz B, Miledi R. The statistical nature of the acetycholine 
%potential and its molecular components.J Physiol. 1972 Aug224(3):665-99

l=110;                                                                              %(iii)
%Source: Hao S, Baltimore D. RNA splicing regulates the temporal order of 
%TNF-induced gene expression. Proc Natl Acad Sci U S A. 
%2013 Jul 16 110(29):11934-9. doi: 10.1073/pnas.1309990110. 
%Supporting Information p.10 table S1

t_final = 24; %Ending time parameter                                                %(iv)
%Source:The Synchronization of Replication and Division Cycles in Individual E. 
%coli Cells. 2016. http://proxy.library.stonybrook.edu/login?url=http://search.ebscohost.com
%/login.aspx?direct=true&db=edsbas&AN=edsbas.64B22A47&site=eds-live&scope=site. 
%Accessed February 28, 2019.

timestep = 1; % Timestep for solving ODEs based on modeling attempts                %(i,iv)
IPTG_begin = 0; %Lower bound for concentration parameter for IPTG based on modeling attempts %(i,iv)
IPTG_step = .2; %Concentration increment for each ODE run in the solver based on modeling attempts %(i,iv)
IPTG_end = 4; %Upper bound on concentration parameter for IPTG based on modeling attempts %(i,iv)
Concentration_range = IPTG_begin:IPTG_step:IPTG_end; %Store IPTG range %(i,iv)
IPTG_iteration_count=0; %Set iteration counter to zero %(i,iv)

for C=IPTG_begin:IPTG_step:IPTG_end %(i,iv)
   
    IPTG_iteration_count=IPTG_iteration_count+1; %increment each time the loop is run
    
    %Initial numbers for each chemical species set to zero
    LacI = 0; IPTG = 0; betagalac = 0;
    
    %Call to MATLAB ODE solver which is in the creaed function 
    [time, Conarray] = Group_2_problemset1b(t_final,timestep,LacI,IPTG,betagalac); %(i)
    
    %Save steady-state (24 hrs) data for each IPTG concentration (SOURCE)
    LacI_data(IPTG_iteration_count)=Conarray(end,1);   %Save data for LacI         %(i)
    IPTG_data(IPTG_iteration_count)=Conarray(end,2);   %Save data for IPTG         %(i)
    betagalac_data(IPTG_iteration_count)=Conarray(end,3);  %Save data for beta-galactosidase %(i)
    %the (end,#) syntax is for adding to the end of a vector or
    %rows/columns in a matrix
end

%Save the data using save function
save('Group2_ODE_data.mat','Concentration_range','LacI_data','IPTG_data','betagalac_data');

%Plot figure with concentration curves
hold on %hold on to use the plot function several times

plot(Concentration_range,LacI_data/max(LacI_data),'g-','LineWidth',3)       %(v,vi)
%Plot the first curve for LacI data, the curve will be green and dashed     
%with a line width of 3

plot(Concentration_range,IPTG_data/max(IPTG_data),'b--o','LineWidth',3)     %(v,vi)
%Plot the second curve for IPTG data, the curve will be blue and dashed
%with circles with a line width of 3

plot(Concentration_range,betagalac_data/max(betagalac_data),'c--*','LineWidth',3) %(v,vi)
%Plot the third curve for betagalac data, the curve will be cyan and dashed
%with a line width of 3

hold off %hold off since plotting is done

xlabel('Extracellular IPTG (ug/ml)'); 
ylabel('Normalized Concentration');
%label both axes using xlabel and ylabel functions

legend('IPTG-free LacI', 'Intracellular IPTG', 'CI::LacZ') %(v)
%create legend to distinguish between curves

title('Group 2 Negative Feedback Gene Circuit') 
%Use title function to create plot title

set(gca,'FontSize',15)                                                       %(vi)
%Set all font sizes to 15
 
toc %End the simulation timer to see how long the program ran 