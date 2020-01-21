% Cumulative sum of vector

V1=randi([-10 10],1,10);
sum_V1=zeros(1,10);
disp(V1)

sum_V1(1)=V1(1);

for i=2:length(V1)
sum_V1(i)=sum_V1(i-1)+V1(i);
fprintf('The sum of V1(1) to V1(%d) is %d.\n',i, sum_V1(i))
end