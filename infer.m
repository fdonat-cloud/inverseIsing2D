function argMax = infer(data)
%INFER returns the result of the optimization
%   Parameters
%
%    data: a numerical matrix or the string 'default'
%
%   Returns
%
%    argMax: numSpins x numSpins numerical matrix
%
%   The (i,j) element of the input should represent the j-th spin of the
%   i-th configuration. The configurations should ideally be randomly
%   sorted from the Maxwell-Boltzmann distribution
%   The (i,j) element of the output represents the inferred effective
%   coupling between the i-th spin and the j-th spin

addpath(genpath('otherFunctions'));

if strcmp(data,'default')
    load('default.mat');
    data = default;
end

numConfigurations = height(data);
numSpins = width(data);
   %this will contain the final result
argMax = zeros(numSpins,numSpins);
   %equality constraint to impose that each spin has coupling zero with itself
Beq = 0;
   %disequality linear constraint to impose that all couplings are non negative
A = -diag(ones(1,numSpins));
B = zeros(numSpins,1);

startingPoint = 0.5*ones(1,numSpins);
OPTIONS = optimoptions(@fmincon,'Algorithm','sqp','MaxFunEvals',30000,'Display','off');
   %cycle that for each spin finds the arg max of the associated
   %log-pseudo-likelihoood
for i=1:numSpins
      %equality constraint to impose that each spin has coupling zero with itself
   Aeq = zeros(1,numSpins);
   Aeq(i) = 1;
      %minimization
   f = @(x)( -logPseudoLikelihood(x,data,i) );
   argMax(i,:) = fmincon(f,startingPoint,A,B,Aeq,Beq,[],[],[],OPTIONS);
      %this is to tell the user where we are in the optimization
   fprintf("%i/%i\n",i,numSpins);
end
end
