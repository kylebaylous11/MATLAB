x=linspace(1,10,20);
y=x.^2;

subplot(1,2,1)
myplot1=plot(x,y,'r');

subplot(1,2,2)
myplot2=loglog(x,y,'b');
text(5,10,'graph\uparrow')




