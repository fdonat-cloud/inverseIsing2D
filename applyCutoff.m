function array = applyCutoff(array,cutoff)
%APPLYCUTOFF deletes the elements of array that are not greater than cutoff

if not( isnumeric(array) && isnumeric(cutoff))
    error('both inputs must be numeric')
end

if not( numel(cutoff) == 1 )
    error('second argument (cutoff) must be a single number')
end
    
if height(array) > 1 && width(array) > 1
    error('first argument must be an array whose height or width is 1')
end

toBeDeleted = [];

for i = 1:length(array)
    if not(array(i) > cutoff)
        toBeDeleted(end+1) = i;
    end
end

if length(toBeDeleted) < length(array)
    array(toBeDeleted) = [];
else % i.e. length(toBeDeleted) == length(array)
    array = [];
end
end