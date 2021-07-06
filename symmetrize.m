function matrix = symmetrize(matrix)
%SYMMETRIZE returns a matrix in which a_ij = a_ji for any i and j
%   In theory the strength of the n-th spin on the m-th spin is equal to the 
%   strength of the m-th on the n-th. In practice this is not true due
%   to sampling errors, so we need to fix this

numRows = height(matrix);
numCols = width(matrix);

%symmetrizing a non square matrix does not make sense
if not(numRows == numCols)
    error('must put a square matrix')
end

%symmetrizing a matrix with NaNs does not make sense
if not( sum(sum(matrix == matrix)) == numel(matrix) )
    error('input must not have NaN values')
end

if not( isnumeric(matrix) )
    error('imput must be a numeric matrix')
end

   % change value of elements over the diagonal
for i = 1:numRows
    for j = 1:numCols
        if i < j
            matrix(i,j) = (matrix(i,j) + matrix(j,i))/2;
        end
    end
end

   % assign that value to the symmetric element under the diagonal
for i = 1:numRows
    for j = 1:numCols
        if i > j
            matrix(i,j) = matrix(j,i);
        end
    end
end

end

end
