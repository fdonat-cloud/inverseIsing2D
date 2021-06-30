%% test function is non negative with minimal data
couplings = -100;
configs = [1];
spin_index = 1;
num_configurations = height(configs);
value = pseudoLikelihood(couplings,configs,spin_index,num_configurations,configs');
assert( not (value < 0) );

%% test function is non negative with degenerate data (100 configurations, all +1)
couplings = zeros(1,100);
configs = ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = pseudoLikelihood(couplings,configs,spin_index,num_configurations,configs');
assert( not (value < 0 ) );

%% test function is non negative with degenerate data (100 configurations, all -1)
couplings = zeros(1,100);
configs = -ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = pseudoLikelihood(couplings,configs,spin_index,num_configurations,configs');
assert( not (value < 0 ) );

%% test function is non negative with degenerate data and large couplings
couplings = 1E6 * ones(1,100);
configs = -ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = pseudoLikelihood(couplings,configs,spin_index,num_configurations,configs');
assert( not (value < 0 ) );

%% test function is non negative with degenerate data and large negative couplings
couplings = -1E6 * ones(1,100);
configs = -ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = pseudoLikelihood(couplings,configs,spin_index,num_configurations,configs');
assert( not (value < 0 ) );

%% test additivity
%I multiply by minus the number of configurations since the function is in
%fact implemented with those factors
couplings = rand(1,100);
configs1 = rand(100,100);
configs2 = rand(100,100);
configs = [configs1;configs2];
spin_index = 1;
num_configurations1 = height(configs1); 
num_configurations2 = height(configs2);
num_configurations = height(configs);
value1 = -num_configurations1 * pseudoLikelihood(couplings,configs1,spin_index,num_configurations1,configs1');
value2 = -num_configurations2 * pseudoLikelihood(couplings,configs2,spin_index,num_configurations2,configs2');
value = -num_configurations * pseudoLikelihood(couplings,configs,spin_index,num_configurations,configs');
tolerance = 1E-3;
assert( abs(value-value1-value2) < tolerance );
