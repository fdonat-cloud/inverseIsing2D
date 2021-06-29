%% test 1, empty input
cutoff = rand;
array = [];
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 2, elements equal to cutoff
cutoff = rand;
array = cutoff*ones(1,2);
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 3, elements greater than cutoff
cutoff = rand;
array = (cutoff+1)*ones(1,2);
result = applyCutoff(array,cutoff);
assert( isequal(result,array) );

%% test 4, scalar equal to cutoff
cutoff = rand;
array = cutoff;
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 5, scalar greater than cutoff
cutoff = rand;
array = cutoff+1;
result = applyCutoff(array,cutoff);
assert( isequal(result,array) );

%% test 6, element greater than cutoff
cutoff = rand;
array = [cutoff+1,cutoff];
result = applyCutoff(array,cutoff);
assert( isequal(result,cutoff+1) );

%% test 7, two elements greater than cutoff 
cutoff = rand;
array = [cutoff+1,cutoff+1];
result = applyCutoff(array,cutoff);
assert( isequal(result,array) );

%% test 8, correct result NaN
cutoff = rand;
array = NaN(1,5);
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 9, that in the end there are fewer or same number of elements than in the beginning
cutoff = rand;
array = rand(10,5);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );

%% test 10, that in the end there are fewer or same number of elements than in the beginning
cutoff = rand;
array = rand(10,50);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );

%% test 11, that in the end there are fewer or same number of elements than in the beginning
cutoff = rand;
array = rand(1,500);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );






