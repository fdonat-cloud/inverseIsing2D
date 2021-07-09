%% test: in the end there must be no more elements than in the beginning
   %this is a general property that must be true for any cutoff and input
rangeCutoff = -5:5;
rangeHeight = 0:10;
rangeWidth = 0:10;

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

%% test: matrix with elements greater than cutoff must be unchanged
   %this must be true in the specific case of values greater than cutoff
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
   %this must be true in the specific case of values not greater than cutoff
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

%% test single NaN must be deleted
rangeCutoff = -5:5;
rangeHeight = 1:10;
rangeWidth = 1:10;

for cutoff = rangeCutoff
    for height = rangeHeight
        for width = rangeWidth
            matrix = (cutoff + 1) * ones(height,width);
            for nanRow = 1:height
                for nanCol = 1:width
                matrix(nanRow,nanCol) = NaN;
                output = applyCutoff(matrix,cutoff);
                assert( sum(output == output) == numel(output) );

                matrix(nanRow,nanCol) = cutoff + 1;
                end
            end
        end
    end
end

