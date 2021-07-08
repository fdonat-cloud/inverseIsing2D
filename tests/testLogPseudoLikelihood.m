%% test inversion of all spins
   %the hamiltonian is invariant under the inversion of all spins, so
   %the log-pseudo-likelihood must not change
   
rangeCouplingsValue = -5:5;
rangeNumConfigurations = 1:10;
rangeNumSpins = 1:10;
   
for var = 0:1
    signData = -1 + 2 * var;%-1 or +1
    for couplingsValue = rangeCouplingsValue
        for numConfigurations = rangeNumConfigurations
            for numSpins = rangeNumSpins
                data = signData * ones(numConfigurations,numSpins);
                oppositeData = -data;
                couplings = couplingsValue * ones(1,numSpins);
                for spinIndex = 1:numSpins
                    outputNormalData = logPseudoLikelihood(couplings,data,spinIndex);
                    outputOppositeData = logPseudoLikelihood(couplings,oppositeData,spinIndex);
                    assert( isequal(outputNormalData,outputOppositeData) );
                end
            end
        end
    end
end

%% test additivity
   %the log-PL of the union of data must be the sum of the log-PLs
   
rangeCouplingsValue = -5:5;
rangeNumConfigurations = 1:10;
rangeNumSpins = 1:10;
   
for var1 = 0:1
    signData1 = -1 + 2*var1;%-1 or +1
    for var2 = 0:1
        signData2 = -1 + 2*var2;%-1 or +1
        for couplingsValue = rangeCouplingsValue
            for numConfigurations1 = rangeNumConfigurations
                for numConfigurations2 = rangeNumConfigurations
                    for numSpins = rangeNumSpins
                        couplings = couplingsValue * ones(1,numSpins);
                        data1 = signData1 * ones(numConfigurations1,numSpins);
                        data2 = signData2 * ones(numConfigurations2,numSpins);
                        data = [data1;data2];
                        numConfigurations = height(data);
                        for spinIndex = 1:numSpins
                            output1 = numConfigurations1 * logPseudoLikelihood(couplings,data1,spinIndex);
                            output2 = numConfigurations2 * logPseudoLikelihood(couplings,data2,spinIndex);
                            output = numConfigurations * logPseudoLikelihood(couplings,data,spinIndex);
                            tolerance = 1E-10;
                            assert( abs(output-output1-output2) < tolerance );
                        end
                    end
                end
            end
        end
    end
end

%% test non positivity
   %since the function is the log a probability, it must never be > 0
   
rangeCouplingsValue = -5:5;
rangeNumConfigurations = 1:10;
rangeNumSpins = 1:10;
   
for var = 0:1
    signData = -1 + 2 * var;%-1 or +1
    for couplingsValue = rangeCouplingsValue
        for numConfigurations = rangeNumConfigurations
            for numSpins = rangeNumSpins
                data = signData * ones(numConfigurations,numSpins);
                couplings = couplingsValue * ones(1,numSpins);
                for spinIndex = 1:numSpins
                    output = logPseudoLikelihood(couplings,data,spinIndex);
                    assert( not (output > 0 ) );
                end
            end
        end
    end
end

%% test non positivity (minimal data)

couplings = 0;
data = [1];
spinIndex = 1;
output = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (output > 0) );

%% test non positivity (degenerate +1 data and no couplings)

numSpins = 500;
numConfigurations = 10000;
couplings = zeros(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = 1;
output = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (output > 0 ) );

%% test non positivity (degenerate -1 data and no couplings)

numSpins = 500;
numConfigurations = 10000;
couplings = zeros(1,numSpins);
data = -ones(numConfigurations,numSpins);
spinIndex = 1;
output = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (output > 0 ) );

%% test non positivity (degenerate data and large > 0 couplings)

numSpins = 500;
numConfigurations = 10000;
couplings = 1E6*ones(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = 1;
output = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (output > 0 ) );

%% test non positivity (degenerate data and large < 0 couplings)

numSpins = 500;
numConfigurations = 10000;
couplings = -1E6*ones(1,numSpins);
data = ones(numConfigurations,numSpins);
spinIndex = 1;
output = logPseudoLikelihood(couplings,data,spinIndex);
assert( not (output > 0 ) );
