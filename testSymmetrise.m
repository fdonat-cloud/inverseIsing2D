%% test zero scalar must be unchanged
matrix = 0;
result = symmetrise(matrix);
assert( isequal(result,matrix) );

%% test zero matrix must be unchanged
height = randi([1 100],1,1);
width = height;
matrix = zeros(height,width);
result = symmetrise(matrix);
assert( isequal(result,matrix) );

%% test diagonal matrix must be unchanged
lengthOfDiag = randi([1,100],1,1);
matrix = diag(rand*ones(1,lengthOfDiag));
result = symmetrise(matrix);
assert( isequal(result,matrix) );

%% test non zero matrix must be transformed correctly
matrix = [[1,2];[1,1]];
result = symmetrise(matrix);
assert( isequal(result,[[1,1.5];[1.5,1]]) );

%% test empty matrix must be unchanged
matrix = [];
result = symmetrise(matrix);
assert( isequal(result,[]) );

%% test output and input must have same number of elements
height = randi([1 100],1,1);
width = height;
matrix = rand(height,width);
result = symmetrise(matrix);
in = numel(matrix);
fin = numel(result);
assert( fin == in );

%% test negative-valued matrix must return negative-valued matrix
height = randi([1 100],1,1);
width = height;
matrix = rand(height,width);
matrix = matrix - 2;
result = symmetrise(matrix);
numFinalNegativeElements = sum(sum(result<0));
assert( numFinalNegativeElements == numel(matrix) );

%% test positive-valued matrix must return positive-valued matrix
height = randi([1 100],1,1);
width = height;
matrix = rand(height,width);
matrix = matrix + 0.2;
result = symmetrise(matrix);
numFinalPositiveElements = sum(sum(result>0));
assert( numFinalPositiveElements == numel(matrix) );





