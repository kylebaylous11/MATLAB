%Practice Nested Script
num=input('Enter the numner: ');
if num < 0
    myans=-2*sind(3*num);
else
    if num == 0
        myans=num;
    else
            if num > 0 && num < 1
                myans=1/2*(10*num-1).^3;
            else
                myans=nthroot((3*num.^2),5);
            end
     end
end
fprintf('The answer is %.3f\n',myans)