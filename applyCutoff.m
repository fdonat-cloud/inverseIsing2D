function array = applyCutoff(matrix,cutoff)
%APPLYCUTOFF  transforms a numerical matrix into a row array and deletes
%any element that is not greater than matrix

if not( isnumeric(matrix) && isnumeric(cutoff))
    error('both inputs must be numeric')
end

if not( numel(cutoff) == 1 )
    error('second argument (cutoff) must be a single number')
end

array = reshape(matrix,1,numel(matrix));
toBeDeleted = [];

for i = 1:numel(array)
    if not( array(i) > cutoff )%true even if array(i) is NaN
        toBeDeleted(end+1) = i;
    end
end

if length(toBeDeleted) < length(array)
    array(toBeDeleted) = [];
else %i.e. length(toBeDeleted) == length(array)
    array = [];
end

end