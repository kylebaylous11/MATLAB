function fn_plotmedmean(vec1)
%This function receives vector data, sorts it, and outputs stats/plots
%Output is statistical analysis and plots of the data
%Kyle Baylous   SBU ID: 111374388
sortvec1=sort(vec1);

MEAN=mean(sortvec1);
MEDIAN=median(sortvec1);
MODE=mode(sortvec1);
STD=std(sortvec1);

fprintf('Mean: %.2f\n',MEAN)
fprintf('Median: %.2f\n',MEDIAN)
fprintf('Mode: %.2f\n',MODE)
fprintf('Std: %.2f\n',STD)

x=(1:length(vec1));
a=(0:length(vec1)+1);

figure
subplot(1,2,1)
plot(x,vec1,'r*')
axis([0,length(vec1)+1,min(vec1)-1,max(vec1)+1])
xlabel('X')
ylabel('Y')

subplot(1,2,2)
plot(x,sortvec1,'r*')
title(sprintf('Median %.2f & Mean %.2f',MEDIAN,MEAN))
axis([0,length(vec1)+1,min(vec1)-1,max(vec1)+1])
xlabel('X')
hold on
plot(a,repmat(MEDIAN,1,length(a)),'b')
plot(a,repmat(MEAN,1,length(a)),'b')
xlabel('X')
ylabel('Y')
end

