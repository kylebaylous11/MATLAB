clc

%data=load('data_bacteria.txt');

t=data(:,1);
N0=data(:,2);
T=20;
t=0:20:200;

figure;
plot(t,N);
title('Bacterial Growth')
xlabel('Time (minutes)')
ylabel('Bacteria Biomass (Number)')

hold on
plot(t,bacteria_growth(N0,t,T))


function [Nt] = bacteria_growth(N0,t,T)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
Nt = N0.*2.^(t./T);

end


