# Inverse 2D Ising problem

The aim of this project is the inference of the ratio ***coupling/temperature*** for each couple of spins of a 2D Ising model via the pseudolikelihood method.

## Theoretical background

Consider a 2D Ising model with Hamiltonian

![equation1](https://latex.codecogs.com/gif.latex?H&space;=&space;-\sum_{i%3Cj}J_{ij}s_{i}s_{j})

where
- the spins ***s<sub>i*** with i = 1,...,N form a configuration of N spins
- ***J<sub>ij*** = ***J<sub>ji*** >= 0 is the coupling between a couple of spins
  
If the system is at contact with a heat reservoir at temperature T, the probability to observe a configuration is ***exp(-H/T)***/***Z***, where the Boltzmann constant is put equal to 1 for simplicity and Z is a normalization factor. This means that the probability is not a function of the couplings ***and*** the temperature, but only of the ratios ***J<sub>ij***/***T*** = ***β<sub>ij***.
Suppose one observes M configurations of the Ising model with such Hamiltonian at temperature T and for some couplings ***J<sub>ij***. In order to infer the effective couplings ***β<sub>ix*** of the i-th spin with all the others one can maximize the logarithm of the pseudo-likelihood (PL)

![equation1](https://latex.codecogs.com/gif.latex?L(\beta_{ix})&space;=&space;\frac{1}{M}\log{\prod_{\mu=1}^{M}{p(s_{i}^{(\mu)}|[s_{j}]_{j!=i}^{(\mu)})}=-\frac{1}{M}\sum_{\mu=1}^{M}{\log[1+e^{-2s_{i}^{(\mu)}\sum_{j!=i}{\beta_{ij}s_{j}^{(\mu)}}}]})
  
with respect to ***β<sub>ix***. The maximum is unique and its argument approaches the arg max of the likelihood (L) in the limit of infinite M, but unlike the latter the PL does not require Z, whose computation time scales exponentially with N. 
The arg max can be viewed as a 1xN array. By maximizieng the PL for all the N spins and merging the results we obtain a NxN matrix with zeros on the diagonal (since ***β<sub>ii*** is put equal to zero) and in principle symmetric.
  
## Required
  
  Matlab
  
## Structure
  
  ### Scripts
  1. *inferIsing.m*: gets the input and performs the optimization using the Matlab function *fmincon*
  2. *analyse.m*: analyses the result of the optimization, modifies it in a plottable form, saves the results in the folder 'results'
  3. *plotResult.m*: generates a plot and a histogram of the inferred couplings and saves them in the folder 'results'
  4. tests for the functions, runnable by typing *results=runtests*
  ### Functions
  1. *pseudoLikelihood.m*: returns the negative of the logarithm of the pseudo-likelihood
  2. *symmetrise.m*: receives a square numerical matrix and returns a symmetrix matrix by computing the mean (***a<sub>ij*** + ***a<sub>ji***)/2
  3. *applyCutoff.m*: receives a matrix and a cutoff and returns an array containing the elements of the matrix that are grater or equal than the cutoff
  ### Data
  1. *default.mat*: the default input, a set of 5000 configurations of the 10x10 Ising model with J=1 for first neighbours only, periodic boundary conditions and T=2. They were generated with the Metropolis algorithm (see...)
  2. *cutoff.mat*: default cutoff
  
  ### Folders
  *results*: in the end, this will contain the file *analysis.mat* and the plots *sorting.jpg* and *histogram.jpg*
  
  ## How to use this project
  
  These are the steps the user must take in order to start and run the project:
  1. Download the project and open it on Matlab
  2. Launch the script *inferIsing* (in order to launch a script just type its name and press enter). The user is asked to insert the name of the file containing the data. Otherwise, by simply pressing enter the optimization starts with the dafault data.
  3. Launch the script *analyse*
  4. Launch the script *plotResult*. This generates the plots and saves them in the folder *results*
  
  ## About the input
 If the user wants to use his/her own data, the data
  1. Must be a numerical matrix loaded in the workspace
  2. Should be a set of configurations randomly sorted from the Maxwell-Boltzmann distribution. For further information see...
  3. Its (i,j) element should represent the j-th spin of the i-th configuration
  4. It should only contain +1 or -1 values, since the PL was built under that hypothesis
  
  
  ## Example
  Running the project with the default input, one gets these results: 
  ![sorting.jpg](https://github.com/fdonat-cloud/inverseIsing2D/blob/master/sorting.jpg?raw=true)
  ![histogram.jpg](https://github.com/fdonat-cloud/inverseIsing2D/blob/master/histogram.jpg?raw=true)
 
  
  
