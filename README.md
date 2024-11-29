## Introduction
This paper considers a class of multi-block nonconvex nonsmooth optimization problems, and this class of problems covers many applications of signal processing and machine learning applications. 
We propose an accelerated block proximal linear method with adaptive momentum (ABPL+) to effectively tackle these challenges.
The method evaluates both a proximal gradient step and a linear extrapolation step for updating each block of variables, opting for the one with the lower function value to maintain a monotonic decrease.
The advantages of our method compared to previous approaches include: 
(1) allowing the extrapolation parameter to be independent of other parameters while utilizing an adaptive extrapolation parameter strategy, thereby improving stability and enhancing acceleration;
(2) ensuring convergence and global convergence while establishing the convergence rate, even when the extrapolation parameter is independent of other parameters; and 
(3) permitting the random selection of variable blocks for updates while maintaining global convergence.
We evaluate our method by applying it to solve the $\ell_0$-norm constrained multi-layer non-negative matrix factorization and sparse nonnegative CP decomposition problems, which are known to be NP-hard in general. 
Numerical results demonstrate that our method outperforms state-of-the-art algorithms, highlighting its effectiveness and potential for broader applications. 

This package contains code for the sparse multiple non-negative matrix factorization with $\ell_0$-constraints ($\ell_0$-smNMF) problem and the sparse non-negative CP tensor decomposition with $\ell_0$-constraints ($\ell_0$-SNCP) problem in the paper[<sup>1</sup>](#refer-id).  

## Code
"L0smNMF" is the sparse multiple non-negative matrix factorization with $\ell_0$-constraints ($\ell_0$-smNMF) function, and "L0SNCP" is the sparse non-negative CP tensor decomposition with $\ell_0$-constraints ($\ell_0$-SNCP) function. 

## How to run our code (Running demo)
A toy example explains how to use the these function. For "L0smNMF", just run the function '[main_Run_me.m](L0smNMF/main_Run_me.m)'. 

For "L0SNCP", before running it, first add the toolbox 'tensortoolbox'[<sup>2</sup>](#refer-id) (www.tensortoolbox.org) to the running path of matlab, and then run the function '[main_Run_me.m](L0SNCP/main_Run_me.m)'. 

Brett W. Bader and Tamara G. Kolda. 2006. Algorithm 862: MATLAB tensor classes for fast algorithm prototyping. ACM Trans. Math. Softw. 32, 4 (December 2006), 635–653. https://doi.org/10.1145/1186785.1186794

## Data and Data preprocessing
This code has built-in the data mentioned in our paper[<sup>1</sup>](#refer-id), and the preprocessing code segment is embedded in our code.

## Contact details

If you have any questions, please contact WeifengYang.Ywf@gmail.com and minwenwen@ynu.edu.cn

## Citing
<div id="refer-id"></div>
[1] Globally Convergent Accelerated Block Proximal Method with Adaptive Momentum for Nonconvex Optimization. Submitted to TNNLS2024


