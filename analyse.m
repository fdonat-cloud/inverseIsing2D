symSolution = symmetrise(solution);
difference = solution - symSolution;
relativeAsymmetricity = norm(difference) / norm(symSolution);
couplings = nullifyDoubles(symSolution);
cutoff = 1E-3;
couplings = applyCutoff(couplings,cutoff);
couplings = sort(couplings,"descend");
numberOfCouplings = numel(couplings);

save('relativeAsimmetricity');
save('cutoff');
save('numberOfCouplings');
movefile('relativeAsimmetricity.mat','analysis');
movefile('cutoff.mat','analysis');
movefile('numberOfCouplings.mat','analysis');



