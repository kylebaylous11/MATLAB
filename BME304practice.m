Time = (0:.5:20);

Bacteria = 10*log(Time).*cos(-.1.*Time);

plot(Time,Bacteria,'');

T=3.5.*(Time);

hold on

plot(Time, T,'r--')

title('Bacteria vs. Time');

xlabel('Time [min]'); 

ylabel('Rate [mM/min]')

legend('Bacteria Growth', 'Line of Best Fit');
grid on;

LowerGrowthValues=[];
k=1;

for i=1:1:numel(Bacteria)
    if Bacteria(i)<0
        LowerGrowthValues(k)=time(i);
        k = k+1;
    end 
end 