%load('configurations1.mat');
%load('configurations2.mat');
load('configurations3.mat');
configurations = input('insert the name of the file containing the set of configurations:');
num_configurations = height(configurations);
num_spins = width(configurations);
transposed = configurations';
inferredCouplingsMatrix = zeros(num_spins,num_spins);%this will contain the final result
beq=0;%equality constraint to impose that each spin has coupling zero with itself

%disequality constraint to impose that all couplings are non negative
A=-diag(ones(1,num_spins));
b=zeros(num_spins,1);

x0=zeros(1,num_spins);%this is the starting point for the minimizer
options = optimoptions(@fmincon,'Algorithm','sqp','MaxFunEvals',30000);

%cycle that for each spin finds the arg max of the associated
%log-pseudo-likelihoood
for i=1:num_spins
   %equality constraint to impose that each spin has coupling zero with itself
   Aeq=zeros(1,num_spins);
   Aeq(i)=1;
   %minimization
   f=@(x)pseudoLikelihood(x,configurations,i,num_configurations,transposed);
   x=fmincon(f,x0,A,b,Aeq,beq,[],[],[],options);
   inferredCouplingsMatrix(i:i,:) = x;%each calling of fmincon fills a single line of "solution" 
   fprintf("%i/%i\n",i,num_spins);%this is to tell the user where we are in the optimization
end