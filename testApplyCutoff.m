%% test 1, empty input must return itself
cutoff = rand;
array = [];
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 2, elements equal to cutoff must be deleted
cutoff = rand;
height = randi([1 100],1,1);
width = randi([1 100],1,1);
array = cutoff*ones(height,width);
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 3, elements greater than cutoff must not be deleted
cutoff = rand;
height = randi([1 100],1,1);
width = randi([1 100],1,1);
array = (cutoff+1)*ones(height,width);
result = applyCutoff(array,cutoff);
fin = numel(result);
in = numel(array);
assert( isequal(in,fin) );

%% test 4, scalar = cutoff must be deleted
cutoff = rand;
array = cutoff;
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 5, scalar > cutoff must be deleted
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

%% test 8, NaNs must be deleted
cutoff = rand;
height = randi([1 100],1,1);
width = randi([1 100],1,1);
array = NaN(height,width);
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test 9, in the end there must be no more elements than in the beginning
cutoff = rand;
height = randi([1 100],1,1);
width = randi([1 100],1,1);
array = rand(height,width);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );





