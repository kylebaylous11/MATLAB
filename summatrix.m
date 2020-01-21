% summation of matrix

mat=input('Enter matrix: ');
[m, n]=size(mat);
%calculate matrix summation in row-wise
sum_mat=0;
for i=1:m
    for j=1:n
        sum_mat=sum_mat+mat(i,j);
    end
    fprintf('the summation of %d-th row is %d\n',i,sum_mat)
end
fprintf('The total summation is %d\n',sum_mat)