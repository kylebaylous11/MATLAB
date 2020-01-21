%This script opens and reads a data file in order to plot the data using textscan 
%Kyle Baylous SBU ID: 111374388
clear
clc
%Choose file
choice=uigetfile;
fid=fopen(choice);
%Error checking for opening the file
while fid==-1
    disp('File opening unsuccessful')
    filename=input('Choose the file by typing it: ','s');
    fid=fopen(filename);
end
%Read in the header 
[header] = textscan(fid,'%s',5); 
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
    disp('File close was sucessful')
else 
    disp('File close was unsuccessful')
end 
figure
%plot the data
x=(1:12);
plot(x,T1,'r*')
hold on
plot(x,T2,'b*')
plot(x,T3,'y*')
plot(x,T4,'g*')
plot(x,T5,'m*')
hold off
legend(T1_info,T2_info,T3_info,T4_info,T5_info)
xlabel('Month')
ylabel('Temperature')
title('Monthly Temperature Info at Stony Brook')
axis([1,12,min(T5)-10,max(T4)+10])



