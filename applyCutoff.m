function array = applyCutoff(matrix,cutoff)
%APPLYCUTOFF returns an array with elements minor than the cutoff
%
%   Parameters
%
%    matrix: a NxM matrix
%    cutoff: a scalar
%
%   Returns
%
%    a 1xR array with R <= N*M
%
%   Raises
%
%    Error if the inputs are not numeric
%    Error if the second parameter is not a scalar

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
