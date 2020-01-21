%AMS 333 HW 2
%Kyle Baylous SBU ID: 111374388

 data = load('squirrel_data.txt');
 
 t=data(:,1);
 pop=data(:,2);
 
 t = t-1980; %Get time starting from t1=0
 t_model = zeros(1,31);
 values = 1:9;
 new_t = horzcat(t_model,values);
 new_t = new_t';
 
 for i= 1:size(new_t)
 
     Nt(i) = 416170.*2.^(new_t(i)/6); %Function N(t) modeling population t years after 2010
 
 end
 plot(t,pop)
 
 xlabel('Time (Years after 1980)')
 ylabel('Grey Squirrel Population')
 
 hold on
 
 %plot(t,Nt) %Plot data until 2019
 extension = (10:19);
 plot2_time = horzcat(new_t', extension);
 plot2_time = plot2_time';
 
 clear Nt
 
  for i= 1:size(plot2_time)
 
     Nt(i) = 416170.*2.^(plot2_time(i)/6); %Function N(t) modeling population t years after 2010
 
  end
 addon = (40:49);
 t_plot2 = horzcat(t', addon);
 plot(t_plot2,Nt)
 
 
