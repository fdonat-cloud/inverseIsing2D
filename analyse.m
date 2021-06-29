load('cutoff.mat');
symSolution = symmetrise(solution);
difference = solution - symSolution;
relativeAsymmetricity = norm(difference) / norm(symSolution);
couplings = zeros(numSpins,numSpins);

%cycle in order to lose redundant info contained in symSolution
for j = 1:numSpins
    for i = 1:numSpins
        if not(i > j)
            couplings(i,j) = symSolution(i,j);
        end
    end
end

couplings = applyCutoff(couplings,cutoff);
%in order to make it communicative when plotted
couplings = sort(couplings,"descend");

numberOfCouplings = numel(couplings);

save analysis.mat relativeAsymmetricity numberOfCouplings solution symSolution
movefile('analysis.mat','results');



