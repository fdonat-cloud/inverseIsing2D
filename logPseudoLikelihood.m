function f = logPseudoLikelihood(couplings,configurations,spinIndex)
%LOGPSEUDOLIKELIHOOD of the couplings between one spin and all the others
%   Parameters:
%    
%    couplings : 1 x numSpins array
%    configurations : num_configurations x numSpins array
%    spinIndex : positive integer
%
%   Returns:
%    
%    The log of the pseudo-likelihood divided by the number of
%    configurations
%
%   Raises:
%    
%    Error if the third parameter is not a positive integer
%    Error if the first parameter has not the same number of elements of 
%    the width of the second parameter
%    Error if any parameter is empty
%
%   All it requires is the effective couplings, the whole data 
%   ('configurations') and the index of the spin 
%   The argument 'couplings' is the 1 x numSpins variable to be varied in
%   order to find the (only) critical point
%
%   For references about the theory, see https://arxiv.org/abs/1702.01522

numConfigurations = height(configurations);
numSpins = width(configurations);
f=0;

if not( spinIndex == round(spinIndex) ) 
    error('third parameter must be a integer')
end

if not(spinIndex > 0)
    error('third parameter must be positive')
end

if numel(spinIndex) == 0 || numel(couplings) == 0 || numel(configurations) == 0
    error('all three parameter must not be empty')
end

if not( numel(couplings) == numSpins )
    error('first parameter must have width(configurations) number of elements')
end

for mu=1:numConfigurations
    scalarProduct = dot(couplings,configurations(mu,:));
    spin = configurations(mu,spinIndex);
    f = f - log(1 + exp(-2*spin*scalarProduct) );
end
   
f = f / numConfigurations;
   
end
