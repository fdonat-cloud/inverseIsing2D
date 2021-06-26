load('default.mat');
configurations = input('insert the name of the file containing the set of configurations (just press enter if you want to use the default data):');%

if numel(configurations) == 0
    configurations = default;
end

num_configurations = height(configurations);
num_spins = width(configurations);
transposed = configurations';
inferredCouplingsMatrix = zeros(num_spins,num_spins);%this will contain the final result
beq=0;%equality constraint to impose that each spin has coupling zero with itself

%disequality constraint to impose that all couplings are non negative
A=-diag(ones(1,num_spins));
b=zeros(num_spins,1);

startingPoint=zeros(1,num_spins);
options = optimoptions(@fmincon,'Algorithm','sqp','MaxFunEvals',30000);

%cycle that for each spin finds the arg max of the associated
%log-pseudo-likelihoood
for i=1:num_spins
   %equality constraint to impose that each spin has coupling zero with itself
   Aeq=zeros(1,num_spins);
   Aeq(i)=1;
   %minimization
   f=@(x)pseudoLikelihood(x,configurations,i,num_configurations,transposed);
   x=fmincon(f,startingPoint,A,b,Aeq,beq,[],[],[],options);
   inferredCouplingsMatrix(i:i,:) = x;%each calling of fmincon fills a single line of "solution" 
   fprintf("%i/%i\n",i,num_spins);%this is to tell the user where we are in the optimization
end