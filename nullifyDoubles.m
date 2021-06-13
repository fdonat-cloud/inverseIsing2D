function matrix = nullifyDoubles(matrix)
%NULLIFYDOUBLES puts equal to zero the elements that are under the
%diagonal

if not(width(matrix) == height(matrix))
    error('must put a square matrix')
end

for j = 1:width(matrix)
    for i = 1:height(matrix)
        if i > j
            matrix(i,j) = 0;
        end
    end
end

end
