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