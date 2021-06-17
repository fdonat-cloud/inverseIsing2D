%% test function is non negative with minimal data
couplings = -100;
configsTot = [1];
spin_index = 1;
num_configurations_tot = height(configsTot);
value = pseudoLikelihood(couplings,configsTot,spin_index,num_configurations_tot,configsTot');
assert( not (value < 0) );

%% test function is non negative with degenerate data (100 configurations, all +1)
couplings = zeros(1,100);
configsTot = ones(100,100);
spin_index = 1;
num_configurations_tot = height(configsTot);
value = pseudoLikelihood(couplings,configsTot,spin_index,num_configurations_tot,configsTot');
assert( not (value < 0 ) );

%% test function is non negative with degenerate data (100 configurations, all -1)
couplings = zeros(1,100);
configsTot = -ones(100,100);
spin_index = 1;
num_configurations_tot = height(configsTot);
value = pseudoLikelihood(couplings,configsTot,spin_index,num_configurations_tot,configsTot');
assert( not (value < 0 ) );

%% test function is non negative with degenerate data and large couplings
couplings = 1E6 * ones(1,100);
configsTot = -ones(100,100);
spin_index = 1;
num_configurations_tot = height(configsTot);
value = pseudoLikelihood(couplings,configsTot,spin_index,num_configurations_tot,configsTot');
assert( not (value < 0 ) );

%% test function is non negative with degenerate data and large negative couplings
couplings = -1E6 * ones(1,100);
configsTot = -ones(100,100);
spin_index = 1;
num_configurations_tot = height(configsTot);
value = pseudoLikelihood(couplings,configsTot,spin_index,num_configurations_tot,configsTot');
assert( not (value < 0 ) );

%% test additivity
couplings = ones(1,100);
configs1 = -ones(100,100);
configs2 = ones(100,100);
configsTot = [configs1;configs2];
spin_index = 1;
num_configurations1 = height(configs1); 
num_configurations2 = height(configs2);
num_configurations_tot = height(configsTot);
value1 = pseudoLikelihood(couplings,configs1,spin_index,num_configurations1,configs1');
value2 = pseudoLikelihood(couplings,configs2,spin_index,num_configurations2,configs2');
valueTot = pseudoLikelihood(couplings,configsTot,spin_index,num_configurations_tot,configsTot');
assert( isequal(valueTot,value1+value2));