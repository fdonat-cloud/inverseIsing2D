function matrix = symmetrise(matrix)
%SYMMETRISE returns a matrix in which a_ij = a_ji for any i and j
%   In theory the strength of the n-th spin on the m-th spin is equal to the 
%   strength of the m-th on the n-th. In practice this is not true due
%   to sampling errors, so we need to fix this

if not( isnumeric(matrix) )
    error('imput must be a numeric matrix')
end

%symmetrising a non square matrix does not make sense
if not(width(matrix) == height(matrix))
    error('must put a square matrix')
end

%symmetrising a matrix with NaNs does not make sense
if not( sum(sum(matrix == matrix)) == numel(matrix) )
    error('input must not have NaN values')
end
    
for i = 1:height(matrix)
    for j = 1:width(matrix)
        if j > i
            matrix(i,j) = (matrix(i,j) + matrix(j,i))/2;
        end
    end
end

for j = 1:width(matrix)
    for i = 1:height(matrix)
        if i > j
            matrix(i,j) = matrix(j,i);
        end
    end
end

end
