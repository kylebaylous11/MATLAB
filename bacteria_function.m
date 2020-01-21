function [Nt] = bacteria_function(N0,t,T)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
Nt = N0.*2.^(t./T);

end