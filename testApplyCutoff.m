%% test empty input
cutoff = rand;
array = [];
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test elements equal to cutoff
cutoff = rand;
array = cutoff*ones(1,2);
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test elements greater than cutoff
cutoff = rand;
array = (cutoff+1)*ones(1,2);
result = applyCutoff(array,cutoff);
assert( isequal(result,array) );

%% test scalar equal to cutoff
cutoff = rand;
array = cutoff;
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test scalar greater than cutoff
cutoff = rand;
array = cutoff+1;
result = applyCutoff(array,cutoff);
assert( isequal(result,array) );

%% test element greater than cutoff
cutoff = rand;
array = [cutoff+1,cutoff];
result = applyCutoff(array,cutoff);
assert( isequal(result,cutoff+1) );

%% test two elements greater than cutoff 
cutoff = rand;
array = [cutoff+1,cutoff+1];
result = applyCutoff(array,cutoff);
assert( isequal(result,array) );

%% test correct result NaN
cutoff = rand;
array = NaN(1,5);
result = applyCutoff(array,cutoff);
assert( isequal(result,[]) );

%% test that in the end there are fewer or same number of elements than in the beginning 1
cutoff = rand;
array = rand(10,5);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );

%% test that in the end there are fewer or same number of elements than in the beginning 2
cutoff = rand;
array = rand(10,50);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );

%% test that in the end there are fewer or same number of elements than in the beginning 3
cutoff = rand;
array = rand(1,500);
result = applyCutoff(array,cutoff);
in = numel(array);
fin = numel(result);
assert( not(fin > in) );






