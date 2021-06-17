%% test correct result 1
cutoff = 1;
array1 = cutoff*ones(1,2);
result = applyCutoff(array1,cutoff);
assert( isequal(result,[]) );

%% test correct result 2
cutoff = 1;
array2 = (cutoff+1)*ones(1,2);
result = applyCutoff(array2,cutoff);
assert( isequal(result,array2) );

%% test correct result 3
cutoff = 1;
array3 = cutoff;
result = applyCutoff(array3,cutoff);
assert( isequal(result,[]) );

%% test correct result 4
cutoff = 1;
array4 = cutoff+1;
result = applyCutoff(array4,cutoff);
assert( isequal(result,array4) );

%% test correct result 5
cutoff = 1;
array5 = [cutoff+1,cutoff];
result = applyCutoff(array5,cutoff);
assert( isequal(result,cutoff+1) );

%% test correct result 6
cutoff = 1;
array6 = [cutoff+1,cutoff+1];
result = applyCutoff(array6,cutoff);
assert( isequal(result,array6) );

%% test correct result 7
cutoff = 1;
array7 = NaN(1,5);
result = applyCutoff(array7,cutoff);
assert( isequal(result,[]) );





