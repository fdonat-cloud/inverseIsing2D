%% test function is non negative with minimal data
couplings = -100;
configs = [1];
spin_index = 1;
num_configurations = height(configs);
value = logPseudoLikelihood(couplings,configs,spin_index);
assert( not (value > 0) );

%% test function is non negative with degenerate data (100 configurations, all +1)
couplings = zeros(1,100);
configs = ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = logPseudoLikelihood(couplings,configs,spin_index);
assert( not (value > 0 ) );

%% test function is non negative with degenerate data (100 configurations, all -1)
couplings = zeros(1,100);
configs = -ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = logPseudoLikelihood(couplings,configs,spin_index);
assert( not (value > 0 ) );

%% test function is non negative with degenerate data and large couplings
couplings = 1E6 * ones(1,100);
configs = -ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = logPseudoLikelihood(couplings,configs,spin_index);
assert( not (value > 0 ) );

%% test function is non negative with degenerate data and large negative couplings
couplings = -1E6 * ones(1,100);
configs = -ones(100,100);
spin_index = 1;
num_configurations = height(configs);
value = logPseudoLikelihood(couplings,configs,spin_index);
assert( not (value > 0 ) );

%% test additivity
couplings = rand(1,100);
configs1 = rand(100,100);
configs2 = rand(100,100);
configs = [configs1;configs2];
spin_index = 1;
num_configurations1 = height(configs1); 
num_configurations2 = height(configs2);
num_configurations = height(configs);
value1 = num_configurations1 * logPseudoLikelihood(couplings,configs1,spin_index);
value2 = num_configurations2 * logPseudoLikelihood(couplings,configs2,spin_index);
value = num_configurations * logPseudoLikelihood(couplings,configs,spin_index);
tolerance = 1E-14;
assert( abs(value-value1-value2) < tolerance );
