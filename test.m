vec1=(randi([-10 10],1,10));

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

figure
subplot(1,2,1)
plot(x,vec1,'r*')
axis([0,11,-11,11])

subplot(1,2,2)
plot(x,sortvec1,'r*')
title(sprintf('Median %.2f & Mean %.2f',MEDIAN,MEAN))
axis([0,11,-11,11])
plot(MEAN,'b')