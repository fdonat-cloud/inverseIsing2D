%% test output is square

rangeValue = 0:1;
rangeNumRows = 1:4;
rangeNumCols = 1:4;

for value = rangeValue
    for numRows = rangeNumRows
        for numCol = rangeNumCols
            input = value * ones(numRows,numCol);
            output = infer(input);
            assert( isequal( width(output) , height(output) ) );
        end
    end
end

%% test output is non negative

rangeValue = 0:1;
rangeNumRows = 1:4;
rangeNumCols = 1:4;

for value = rangeValue
    for numRows = rangeNumRows
        for numCol = rangeNumCols
            input = value * ones(numRows,numCol);
            output = infer(input);
            
            for i=1:width(output)
                for j=1:height(output)
                    assert( not( output(i,j) < 0 ) );
                end
            end
           
        end
    end
end

%% test correct result

input = [];
output = infer(input);
assert( isequal(output,input) );

