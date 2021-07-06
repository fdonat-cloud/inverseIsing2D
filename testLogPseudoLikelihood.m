%% test non positivity
   %since the function is the log a probability, it must never be > 0
for var = 0:1
    signData = -1 + 2 * var;%-1 or +1
    for couplingsValue = -5:5
        for numConfigurations = 1:10
            for numSpins = 1:10
                data = signData * ones(numConfigurations,numSpins);
                couplings = couplingsValue*ones(1,numSpins);
                for spinIndex = 1:numSpins
                    value = logPseudoLikelihood(couplings,data,spinIndex);
                    assert( not (value > 0 ) );
                end
            end
        end
    end
end

%% test additivity
   %the log-PL of the union of data must be the sum of the log-PLs
for var1 = 0:1
    signData1 = -1 + 2*var1;%-1 or +1
    for var2 = 0:1
        signData2 = -1 + 2*var2;%-1 or +1
        for couplingsValue = -5:5
            for numConfigurations1 = 1:10
                for numConfigurations2 = 1:10
                    for numSpins = 1:10
                        couplings = couplingsValue * ones(1,numSpins);
                        data1 = signData1 * ones(numConfigurations1,numSpins);
                        data2 = signData2 * ones(numConfigurations2,numSpins);
                        data = [data1;data2];
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
        end
    end
end

%% test inversion of all spins
   %the hamiltonian is invariant under the inversion of all spins, so
   %the log-pseudo-likelihood must not change
for var = 0:1
    signData = -1 + 2 * var;%-1 or +1
    for couplingsValue = -5:5
        for numConfigurations = 1:10
            for numSpins = 1:10
                data = signData * ones(numConfigurations,numSpins);
                oppositeData = -data;
                couplings = couplingsValue*ones(1,numSpins);
                for spinIndex = 1:numSpins
                    valueNormalData = logPseudoLikelihood(couplings,data,spinIndex);
                    valueOppositeData = logPseudoLikelihood(couplings,oppositeData,spinIndex);
                    assert( isequal(valueNormalData,valueOppositeData) );
                end
            end
        end
    end
end

%% test additivity (random spins)
   %the log-PL of the union of data must be the sum of the log-PLs
spinRange = 200;
configRange = 5000;
numSpins = randi([1 spinRange],1,1);
numConfigurations1 = randi([1 configRange],1,1);
numConfigurations2 = randi([1 configRange],1,1);
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

%% test non positivity (minimal data)
couplings = 0;
data = [1];
spinIndex = 1;
num_configurations = height(data);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0) );

%% test non positivity (degenerate +1 data and no couplings)
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = zeros(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test non positivity (degenerate -1 data and no couplings)
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = zeros(1,numSpins);
data = -ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test non positivity (degenerate data and large >0 couplings)
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = 1E6*ones(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );

%% test non positivity (degenerate data and large <0 couplings)
numSpins = randi([100 200],1,1);
numConfigurations = randi([1 5000],1,1);
couplings = -1E6*ones(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = randi([1 numSpins],1,1);
value = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (value > 0 ) );
