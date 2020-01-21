%beautyofmath
clc


left='';
right='';
for i=1:9
    left=strcat(left,int2str(i));
    right=strcat(right,int2str(10-i));
    fprintf('%s x 8 + %d = %s\n',left,i,right)
end 