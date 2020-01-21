function outmin = matrixmin(mat)
% "fn_mymatmin" finds the min in every column in a matrix.
% Returns a vector of the column minima
% Format: fn_mymatmin(matrix)
[r, c] = size(mat);
outmin = zeros(1,c); % Preallocate the vector to the number of columns
for i = 1:c
    minsofar = mat(1,i); % the min so far is the first
        for j = 1:r
            if mat(j,i) < minsofar
            minsofar = mat(j,i);
            end
        end
    outmin(i) = minsofar; % store the minimum value of i-th colomn to preallocated vector
end

end