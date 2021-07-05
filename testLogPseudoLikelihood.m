%% test function is non positive with minimal data
couplings = rand;
data = [1];
spinIndex = 1;
num_configurations = height(data);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0) );

%% test function is non positive with degenerate data and no couplings
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = zeros(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test function is non positive with degenerate data and no couplings
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = zeros(1,numSpins);
data = -ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test non positivity with degenerate data and large >0 couplings
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = 1E6*ones(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test non positivity with degenerate data and large <0 couplings
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = -1E6*ones(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test additivity
% the log-PL of the union of data must be the sum of the log-PLs
numSpins = randi([1 200],1,1);
numConfigurations1 = randi([1 5000],1,1);
numConfigurations2 = randi([1 5000],1,1);
couplings = rand(1,numSpins);
data1 = rand(numConfigurations1,numSpins);
data2 = rand(numConfigurations2,numSpins);
data = [data1;data2];
spinIndex = randi([1 numSpins],1,1);
numConfigurations = height(data);
value1 = numConfigurations1 * logPseudoLikelihood(couplings,data1,spinIndex);
value2 = numConfigurations2 * logPseudoLikelihood(couplings,data2,spinIndex);
value = numConfigurations * logPseudoLikelihood(couplings,data,spinIndex);
tolerance = 1E-4;
assert( abs(value-value1-value2) < tolerance );

%% test additivity 2
% the log-PL of the union of data must be the sum of the log-PLs
for numConfigurations1 = 1:10
    for numConfigurations2 = 1:10
        for numSpins = 1:100
            couplings = rand(1,numSpins);
            data1 = rand(numConfigurations1,numSpins);
            data2 = rand(numConfigurations2,numSpins);
            data = [data1;data2];
            numConfigurations = height(data);
            numConfigurations = height(data);
            for spinIndex = 1:numSpins
                value1 = numConfigurations1 * logPseudoLikelihood(couplings,data1,spinIndex);
                value2 = numConfigurations2 * logPseudoLikelihood(couplings,data2,spinIndex);
                value = numConfigurations * logPseudoLikelihood(couplings,data,spinIndex);
                tolerance = 1E-10;
                assert( abs(value-value1-value2) < tolerance );
            end
        end
    end
end
