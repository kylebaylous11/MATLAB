%This script opens and reads a data file in order to plot the data using textscan
%The plot is of waterfall type  
%Kyle Baylous SBU ID: 111374388
clear
clc
%Open file
choice='monthly_temp_SB.txt';
fid=fopen(choice);
%Error checking for opening the file
while fid==-1
    disp('File opening unsuccessful')
    filename=input('Choose the file by typing it: ','s');
    fid=fopen(filename);
end
%Read in the header 
[header]=textscan(fid,'%s',5); 
T1_info=header{1}{1}; 
T2_info=header{1}{2}; 
T3_info=header{1}{3}; 
T4_info=header{1}{4}; 
T5_info=header{1}{5};
%Read in data from chosen file
data=textscan(fid,'%s %f %f %f %f %f');
%Separate the data
months=data{1};
T1=data{2};
T2=data{3};
T3=data{4};
T4=data{5};
T5=data{6};

close=fclose(fid);
if close==0
    disp('File close was successful')
else 
    disp('File close was unsuccessful')
end 
%Create waterfall plot
tempmat=[T1,T2,T3,T4,T5]; %Save temperature data in matrix
z=tempmat';
figure
myplot=waterfall(z);
%Modify plot
myplot.FaceAlpha=0.5;
myplot.LineWidth=2;
xlabel('Month');
ylabel('Temperature Data'); 
zlabel('Temperature (F)'); 
title('SB Monthly Temperature Data'); 
myplot.Parent.XTick=1:12;
myplot.Parent.XTickLabel={'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug',...
    'Sep','Oct','Nov','Dec'};
myplot.LineStyle=':';

