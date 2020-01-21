%AMS 333 HW 2, Fourth Part: Discrete Logistic Equation
%Kyle Baylous SBU ID: 111374388

clear all; close all

numIterations = 50;
r = 1;
t = 0:numIterations;
%N = zeros(size(t));


%for N0 = 0:2
    N(1)=0;
    for i=1:50
    %N(1) = N0;
    N(i+1) = r.*N(i).*(1-N(i))
    
    plot(t,N)
    hold on
    end
  
    %N_matrix(N0+1,:)= N;
%end


%hold on
