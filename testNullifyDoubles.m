%% test correct result 1
matrix1 = 0;
result = nullifyDoubles(matrix1);
assert( isequal(result,matrix1) );

%% test correct result 2
matrix2 = zeros(2,2);
result = nullifyDoubles(matrix2);
assert( isequal(result,matrix2) );

%% test correct result 3
matrix3 = ones(2,2);
result = nullifyDoubles(matrix3);
value = [1,1;0,1];
assert( isequal(result,value) );


% aggiungere un test che verifica gli errori


