%% test correct result (empty input)

input = [];
output = analyze(input);
fin = numel(output);
in = numel(input);
assert( isequal(output,[]) );

%% test: in the end there must be not more elements than in the beginning
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
