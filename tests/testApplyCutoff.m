%% test in the end there must be no more elements than in the beginning
rangeCutoff = -5:5;
rangeHeight = 0:10;
rangeWidth = 0:15;

for cutoff = rangeCutoff
    for value = (cutoff-10):(cutoff+10)
        for height = rangeHeight
            for width = rangeWidth
                matrix = value * ones(height,width);
                output = applyCutoff(matrix,cutoff);
                in = numel(matrix);
                fin = numel(output);
                assert( not(fin > in) );
            end
        end
    end
end

%% test matrix with elements greater than cutoff must be unchanged
rangeCutoff = -5:5;
rangeHeight = 0:10;
rangeWidth = 0:15;

for cutoff = rangeCutoff
    for value = (cutoff+0.1):(cutoff + 10)
        for height = rangeHeight
            for width = rangeWidth
                matrix = value * ones(height,width);
                output = applyCutoff(matrix,cutoff);
                in = numel(matrix);
                fin = numel(output);
                assert( fin == in );
            end
        end
    end
end

%% test matrix with elements minor than or equal to cutoff must be nullified
rangeCutoff = -5:5;
rangeHeight = 0:10;
rangeWidth = 0:10;

for cutoff = rangeCutoff
    for value = (cutoff-10):cutoff
        for height = rangeHeight
            for width = rangeWidth
                matrix = value * ones(height,width);
                output = applyCutoff(matrix,cutoff);
                fin = numel(output);
                assert( fin == 0 );
            end
        end
    end
end

%% test empty input must return itself
rangeCutoff = -5:5;

for cutoff = rangeCutoff
    matrix = [];
    output = applyCutoff(matrix,cutoff);
    assert( isequal(output,matrix) );
end

%% test NaNs must be deleted
rangeCutoff = -100:100;
rangeHeight = 0:10;
rangeWidth = 0:10;

for cutoff = rangeCutoff
    for height = rangeHeight
        for width = rangeWidth
            matrix = NaN(height,width);
            output = applyCutoff(matrix,cutoff);
            assert( isequal(output,[]) );
        end
    end
end



