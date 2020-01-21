%This script opens and reads a data file in order to plot the data using fscanf 
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
[info] = fscanf(fid,'%s%c%s%c%s%c%s%c%s\n',9); 
[header]=strsplit(info); 
T1_info=char(header{1}); %avg.temp
T2_info=char(header{2}); %avg.high.temp 
T3_info=char(header{3}); %avg.low.temp 
T4_info=char(header{4}); %highest.rec.temp
T5_info=char(header{5}); %lowest.rec.temp

%Read in the data from chosen file
data=fscanf(fid,'%s %f %f %f %f %f\n',[8,inf]); 

close=fclose(fid);
if close==0
    disp('File close was sucessful')
else 
    disp('File close was unsuccessful')
end 

data=data';

T1=data(:,4);
T2=data(:,5);
T3=data(:,6);
T4=data(:,7); 
T5=data(:,8);

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



