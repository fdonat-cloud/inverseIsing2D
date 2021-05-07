# inverse_ising2D
Matlab script that uses maximum pseudo-likelihood method in order to find couplings/temperature of 2D Ising model from a set of Ising configurations.
Given the 2D Ising model with hamiltonian

if the system is dipped in a thermal bath at temperature T the expected value of an observable O is 

where 
is the probability of observing a single configuration.

The direct Ising problem consists in computing observables like energy and magnetization knowing the parameters of the model (temperature, couplings and magnetic fields). On the other hand the inverse Ising problem consists in inferring those parameters having observed a set of configurations.
In this project we will use the method of maximizing the pseudo-likelihood. The pseudolikelihood has a single maximum () and has the same position of the likelihood in the limit of infinite observations (). Contrarily to the likelihood, the pseudolikelihood doesn't need the knowledge of the partition function, whose computation is extremely heavy for large Ns. The configurations you want to base this inference on must respect the hypothesis of equilibrium, i.e. they should have been randomly mined from the Boltzmann distribution. This means same temperature, and no correlations. In order to avoid correlations, refer to texts like

The pseudolikelihood is defined as 

To use this definition we separate the hamiltonian in a term involving only the i-th spin and a term involving all the other spins:

so the probability of observing that the i-th spin has value s_i knowing the value of all the other spins of the configuration is

The sum over all the configurations gives the pseudolikelihood. 
The variable that maximizes the pseudolikelihood consists of a NxN array for the couplings (the i-th line reporting the couplings of the i-th spin with all the other spins) and a 1xN array for the magnetic fields (the i-th element representing the magnetic field acting on the i-th spin).
We can perform the maximization in 2 ways:

Consider a 2D Ising model with hamiltonian
where the sum runs over all couples of spins. If the system is dipped in a thermal bath at temperature T the expected value of an observable O is 

where 
is the probability of observing a single configuration.

The direct Ising problem consists in computing observables like energy and magnetization knowing the parameters of the model (temperature, couplings and magnetic fields). On the other hand the inverse Ising problem consists in inferring those parameters having observed a set of configurations.

What you need: a set of Ising 2D configurations, generated at any temperature and with zero magnetic field. Of course the inference gets better as long as the configurations are uncorrelated and as long as the set gets larger.
What this software does: the first outputs are
a NxN asymmetric matrix, where N is the number of spins in a configuration, whose ij element represents the inferred effective coupling between the i-th and the j-th spin;
its coefficient of simmetricity. The more this matrix is close to a symmetric one, the more the inference is good, since the i-th and the j-th spin act on each other in the same way.
After making the effective couplings matrix symmetric, the software plots its non zero elements in descent order in order to give a synopsis of the couplings. It also generates an histogram of the values.
Finally, only if the user knows the real parameters behind the configurations, the software computes the relative reconstruction error between the real parameters and the inferred ones.

The inferred couplings matrix is usually affected by sampling noise. There is no standard way to interpret the data. The generated plots help, but the user should use some prior knowledge of the parameters in order to get more information from the plots. For example one could apply a cutoff if he/she has an idea about the number of non zero couplings or about their magnitude. 



