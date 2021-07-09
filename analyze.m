function couplings = analyzeIsing(argMax)
%ANALYZEISING symmetrizes the input and makes it a cut off and sorted vector
%   Parameters
%
%    argMax: a numerical square matrix
%
%   Returns
%
%    couplings: 1 x M numerical matrix
%
%   Raises
%
%    Error if the input is not a square matrix
%    Error if the input is not numeric
%
%   The input should be the output of the function infer.m

if not( width(argMax) == height(argMax) )
    error('input must be a square matrix')
end

if not( isnumeric(argMax) )
    error('imput must be a numeric matrix')
end

numSpins = width(argMax);
couplings = zeros(numSpins,numSpins);
addpath(genpath('otherFunctions'));
load('cutoff.mat');
symArgMax = symmetrize(argMax);
difference = argMax - symArgMax;
relativeAsymmetricity = norm(difference) / norm(symArgMax);

   %cycle in order to lose redundant info contained in symArgMax
for j = 1:numSpins
    for i = 1:numSpins
        if not(i > j)
            couplings(i,j) = symArgMax(i,j);
        end
    end
end

couplings = applyCutoff(couplings,cutoff);
   %in order to make it communicative when plotted
couplings = sort(couplings,"descend");

save analysis.mat relativeAsymmetricity argMax symArgMax
movefile('analysis.mat','results');
end
