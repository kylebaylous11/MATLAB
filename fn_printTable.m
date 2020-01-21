function fn_printTable(mat)
[r c]=size(mat);
for i=1:r
    for j=1:c
        fprintf('%10.2f', mat(i,j))
    end
    fprintf('\n')
end
end

