# Inverse 2D Ising problem

The aim of this project is the inference of the ratio ***coupling/temperature*** for each couple of spins of a 2D Ising model via the pseudolikelihood method. The project was built in Matlab with the version 9.9.0.1524771 (R2020b) Update 2. It makes use of the function *fmincon* and its SQP optimization algorithm.

## Theoretical background

Consider a 2D Ising model with Hamiltonian

![equation1](https://latex.codecogs.com/gif.latex?H&space;=&space;-\sum_{i%3Cj}J_{ij}s_{i}s_{j})

where
- the spins ***s<sub>i*** with i = 1,...,N form a configuration of N spins
- ***J<sub>ij*** = ***J<sub>ji*** >= 0 is the coupling between a couple of spins
  
If the system is at contact with a heat reservoir at temperature *T*, the probability to observe a configuration is ***exp(-H/T)***/***Z***, where the Boltzmann constant is put equal to 1 for simplicity and Z is a normalization factor. This means that the probability is not a function of the couplings ***and*** the temperature, but only of the ratios ***J<sub>ij***/***T*** = ***β<sub>ij***.
Suppose one observes M configurations of the Ising model with such Hamiltonian and some couplings ***J<sub>ij*** at temperature *T*. In order to infer the effective couplings ***β<sub>ix*** = (β<sub>i1,...,β<sub>iN) of the i-th spin with all the other spins one can maximize the logarithm of the pseudo-likelihood (PL)

![equation1](https://latex.codecogs.com/gif.latex?PL(\beta_{ix})&space;=&space;\frac{1}{M}\log{\prod_{\mu=1}^{M}{p(s_{i}^{(\mu)}|[s_{j}]_{j!=i}^{(\mu)})}=-\frac{1}{M}\sum_{\mu=1}^{M}{\log[1+e^{-2s_{i}^{(\mu)}\sum_{j!=i}{\beta_{ij}s_{j}^{(\mu)}}}]})
  
with respect to ***β<sub>ix***. The maximum is unique and when M approaches infinity its argument approaches the arg max of the likelihood; unlike the likelihood the PL does not require Z, whose computation time scales exponentially with N. 
The arg max has dimension N. By maximizing the PL for all the N spins we obtain a NxN matrix with zeros on the principal diagonal (since ***β<sub>ii*** is put equal to zero) and in principle symmetric. In practice, due to sampling errors, the matrix gets more and more symmetric as M approaches infinity.
  For references about the PL for the Ising model, see [this article](https://arxiv.org/abs/1702.01522).

## Structure
  
  ### Functions the user uses directly
  1. *infer.m*: gets the input and performs the optimization using the Matlab function *fmincon*
  2. *analyze.m*: analyses the result of the optimization, modifies it in a plottable form, saves the results in the folder *results*
  3. *plotResult.m*: generates a plot and a histogram of the inferred couplings and saves them in the folder *results*
  ### Other functions (contained in the folder *otherFunctions*)
  1. *logPseudoLikelihood.m*: returns the log-pseudo-likelihood
  2. *symmetrize.m*: receives a square numerical matrix and returns a symmetrix matrix by computing the mean (***a<sub>ij*** + ***a<sub>ji***)/2
  3. *applyCutoff.m*: receives a matrix and a cutoff and returns an array containing the elements of the matrix that are grater or equal than the cutoff
  ### Data
  1. *default.mat*: the default input, a set of 5000 configurations of the 10x10 Ising model with J=1 for first neighbours only, periodic boundary conditions and T=2. They were generated with the Metropolis algorithm (see [this link](https://www.asc.ohio-state.edu/braaten.1/statphys/Ising_MatLab.pdf) for further information)
  2. *cutoff.mat*: default cutoff
  ### Tests (contained in the folder *tests*)
  Tests for the pure functions contained in *otherFunctions*, runnable by opening on Matlab the folder *tests* and typing *results=runtests* (check that the folders that contain the functions tested are added on the path!)
  ## How to use this project
  
 If the user wants to use his/her own data, the data
  1. Must be a numerical matrix loaded in the workspace
  2. Should ideally be a set of configurations randomly sorted from the Maxwell-Boltzmann distribution
  3. Its (i,j) element should represent the j-th spin of the i-th configuration
  4. It should only contain +1 or -1 values, since the PL was built under that hypothesis
  
  These are the steps the user must take in order to start and run the project:
  1. Download the project and open it on Matlab
  2. Launch the function *infer* by typing *argMax = infer(data)* if one wants to use his/her own data, by typing *argMax = infer('default')* if one wants to use the default data
  3. Launch the function *analyze* by typing *couplings = analyze(argMax)*
  4. Launch the script *plotResult* by typing *plotResult(couplings)*. This generates the plots and saves them in the folder *results*
  
  ## Example
  Running the project with the default input, one gets these results: 
  
  ![sorting.jpg](https://github.com/fdonat-cloud/inverseIsing2D/blob/master/imagesForREADME/sorting.jpg?raw=true)
  ![histogram.jpg](https://github.com/fdonat-cloud/inverseIsing2D/blob/master/imagesForREADME/histogram.jpg?raw=true)
  
The first plot shows that there is a step between couplings with values from 0.30 to 0.60 and couplings with values from cutoff (0.001) to 0.15. The histogram shows a symmetric distribution centered around 0.45 and a distribution typical of noise for the smaller values. The distribution centered around 0.45 is made up of 200 occurrences, which is the actual number of couplings since the input data were about a 10x10 Ising model with first neighbours interaction and periodic boundary conditions. The real value of the coupling is 0.50. 
  There is not a general rule to interpret these plots. One should rely on previous knowledge about the data (if there is any) and remember that more data mean better inference. For information about the precision of this method for various temperatures and couplings, see [this article](https://arxiv.org/abs/1702.01522).
 
  
  
