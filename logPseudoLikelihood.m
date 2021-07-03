function f = logPseudoLikelihood(couplings,configurations,spin_index)
%LOGPSEUDOLIKELIHOOD returns the log-pseudo-likelihood of the
%effective couplings of the spin_index-th spin with all the other spins
%   All it requires is the effective couplings, the whole data 
%   ('configurations') and the index of the spin 
%   The argument 'couplings' is the 1 x num_spins variable to be varied in
%   order to find the (only) critical point
   
   num_configurations = height(configurations);
   f=0;
   
   for mu=1:num_configurations
      scalarProduct = dot(couplings,configurations(mu,:));
      spin = configurations(mu,spin_index);
      f = f - log(1 + exp(-2*spin*scalarProduct) );
   end
   
   f = f / num_configurations;
   
end
