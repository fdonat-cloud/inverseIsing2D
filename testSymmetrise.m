%% test correct result zero scalar
matrix = 0;
result = symmetrise(matrix);
assert( isequal(result,matrix) );

%% test correct result zero matrix
matrix = zeros(2,2);
result = symmetrise(matrix);
assert( isequal(result,matrix) );

%% test correct result diagonal matrix
matrix = diag(rand*ones(1,5));
result = symmetrise(matrix);
assert( isequal(result,matrix) );

%% test correct result non zero matrix
matrix = [[1,2];[1,1]];
result = symmetrise(matrix);
assert( isequal(result,[[1,1.5];[1.5,1]]) );

%% test correct result empty matrix
matrix = [];
result = symmetrise(matrix);
assert( isequal(result,[]) );



