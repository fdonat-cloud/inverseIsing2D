%%
couplings = -100;
configurations = [1];
spin_index = 1;
num_configurations = height(configurations);
value = pseudoLikelihood(couplings,configurations,spin_index,num_configurations,configurations');
assert( value > 0 | value ==0 );