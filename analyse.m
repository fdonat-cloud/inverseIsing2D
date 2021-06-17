inferredCouplings = inferredCouplingsMatrix;
inferredCouplings = symmetrise(inferredCouplings);
difference = inferredCouplingsMatrix - inferredCouplings;
relativeAsymmetricity = norm(difference) / norm(inferredCouplings);
inferredCouplings = nullifyDoubles(inferredCouplings);
cutoff = 1E-3;
inferredCouplings = applyCutoff(inferredCouplings,cutoff);
inferredCouplings = sort(inferredCouplings,"descend");
numberOfCouplings = numel(inferredCouplings);
%mkdir analysis;
%save('relativeAsimmetricity');
%save('cutoff');



