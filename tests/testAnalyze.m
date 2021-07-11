%% test: in the end there must be not more elements than in the beginning
   %the input is symmetric and has zeros on the diagonal like the output of infer.m
heightRange = 1:5;
valueRange= -1:1;

for value = valueRange
    for height= heightRange
        input = value * ones(height,height);
        for i = 1:height
            input(i,i) = 0;
        end
            output = analyze(input);
            assert( not( numel(output) > numel(input) ) );
        
    end
end

%% test: output is descent sorted
   %the input is symmetric and has zeros on the diagonal like the output of infer.m
heightRange = 1:5;
valueRange= -1:1;

for value = valueRange
    for height= heightRange
        input = value * ones(height,height);
        for i = 1:height  
            input(i,i) = 0;
        end
        
        output = analyze(input);
        assert( isequal( sort(output) , output ) );
        
        end
end

%% test correct result (empty input)

input = [];
output = analyze(input);
fin = numel(output);
in = numel(input);
assert( isequal(output,[]) );
