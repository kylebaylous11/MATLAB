fid=fopen('READINPRAC.txt');
while fid==-1
    name=input('Enter filename: ','s'); 
    fid=fopen(name);
end 

header=fgetl(fid);
headerinfo=strsplit(header);
animal=headerinfo{1};
heavy=headerinfo{2};
meta=headerinfo{3};

data=textscan(fid,'%s %f %f');
name=data{1};
weight=data{2};
metabolism=data{3};

close=fclose(fid); 
if close==0
    disp('Good')
else 
    disp('Error')
end 

figure
subplot(1,2,1)
plot(weight,metabolism,'r*')
hold on
weight_fit=(0:.1:400);
curve1=polyfit(weight,metabolism,3);
fit1=polyval(curve1,weight_fit); 
plot(weight_fit,fit1,'b-')

subplot(1,2,2)
loglog(weight,metabolism,'b')
hold on
curve2=fit(weight,metabolism,'power1');
fit2=polyval(curve2,weight_fit); 
plot(weight_fit,fit2,'r-')

