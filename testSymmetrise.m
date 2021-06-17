%% test correct result 1
matrix1 = 0;
result = symmetrise(matrix1);
assert( isequal(result,matrix1) );

%% test correct result 2
matrix2 = zeros(2,2);
result = symmetrise(matrix2);
assert( isequal(result,matrix2) );

%% test correct result 3
matrix3 = diag(ones(1,5));
result = symmetrise(matrix3);
assert( isequal(result,matrix3) );

%% test correct result 4
matrix4 = [[1,2];[1,1]];
result = symmetrise(matrix4);
assert( isequal(result,[[1,1.5];[1.5,1]]) );

% aggiungere un test che verifica gli errori


