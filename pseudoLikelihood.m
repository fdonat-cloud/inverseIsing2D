function f = pseudoLikelihood(couplings,configurations,spin_index,num_configurations,transposedConfigurations)
%PSEUDOLIKELIHOOD returns the negative of the log-pseudo-likelihood of the
%value of one spin conditioned to the values of all other spins
%   The argument 'couplings' is the variable to be varied in order to find 
%   the (only) critical point
   
   f=0;
   for mu=1:num_configurations
      array1 = transposedConfigurations(:,mu);
      array2 = configurations(mu,spin_index);
      f = f + log(1 + exp(-2*array2*(couplings*array1) ) );
   end
   f = f / num_configurations;
end
