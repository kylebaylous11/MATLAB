%mean value

vec=input('Please enter a vector: ');

[mean]=fn_mean(vec);

fprintf('This vector has a mean value of %.5f.\n',mean)

plot(vec)
xlabel('x')
ylabel('y')
mytitle=sprintf('The mean is %.5f',mean);
title(mytitle)
