load('default.mat');
data = input('insert the name of the file containing the set of configurations (just press enter if you want to use the default data):');%

if numel(data) == 0
    data = default;
end

numConfigurations = height(data);
numSpins = width(data);
transposed = data';
solution = zeros(numSpins,numSpins);%this will contain the final result
beq=0;%equality constraint to impose that each spin has coupling zero with itself

%disequality constraint to impose that all couplings are non negative
A=-diag(ones(1,numSpins));
b=zeros(numSpins,1);

startingPoint=0.5*ones(1,numSpins);
options = optimoptions(@fmincon,'Algorithm','sqp','MaxFunEvals',30000);

%cycle that for each spin finds the arg max of the associated
%log-pseudo-likelihoood
for i=1:numSpins
   %equality constraint to impose that each spin has coupling zero with itself
   Aeq=zeros(1,numSpins);
   Aeq(i)=1;
   %minimization
   f=@(x)pseudoLikelihood(x,data,i,numConfigurations,transposed);
   x=fmincon(f,startingPoint,A,b,Aeq,beq,[],[],[],options);
   solution(i,:) = x;%each calling of fmincon fills a single line of "solution" 
   fprintf("%i/%i\n",i,numSpins);%this is to tell the user where we are in the optimization
end