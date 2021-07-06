%% test output and input must have same number of elements
rangeHeight = 0:10;

for var = 0:1
    sign = -1 + 2 * var;%-1 or +1
    for height = rangeHeight
        width = height;
        input = sign * ones(height,width);
        output = symmetrize(input);
        in = numel(input);
        fin = numel(output);
        assert( in == fin );
    end
end

%% test positive-valued matrix must return positive-valued matrix
rangeHeight = 0:10;

for height = rangeHeight
    width = height;
    input = ones(height,width);
    output = symmetrize(input);
    numFinalPositiveElements = sum(sum(output > 0)); 
    assert( numFinalPositiveElements == numel(input) );
end

%% test negative-valued matrix must return negative-valued matrix
rangeHeight = 0:10;

for height = rangeHeight
    width = height;
    input = -ones(height,width);
    output = symmetrize(input);
    numFinalPositiveElements = sum(sum(output < 0)); 
    assert( numFinalPositiveElements == numel(input) );
end

%% test diagonal matrix must be unchanged
rangeDiagLength = 0:10;
rangeValues = -10:10;

for diagLength = rangeDiagLength
    for value = rangeValues
        input = diag(value * ones(1,diagLength));
        output = symmetrize(input);
        assert( isequal(output,input) );
    end
end

%% test correct result
input = [[1,2];[1,1]];
output = symmetrize(input);
assert( isequal(output,[[1,1.5];[1.5,1]]) );

%% test empty matrix must be unchanged
input = [];
output = symmetrize(input);
assert( isequal(output,[]) );
