# Example 2 – Finite-Time Stabilization of Delayed Neural Networks

This example presents the numerical simulations discussed in Example 2 of the following research paper:

**Reference**

L. Wang, Y. Shen, and Z. Ding, "Finite time stabilization of delayed neural networks," *Neural Networks*, vol. 70, pp. 74–80, 2015.

## 1. Overview

Example 2 investigates the finite-time stabilization of a two-dimensional delayed neural network.

The example considers a neural network with a time-varying delay and saturation activation functions. Two numerical simulations are considered: the behavior of the system without control and its behavior under the feedback controller proposed in the paper.

## 2. System Parameters

The simulation uses the system matrices and parameters specified in Equation (32) of the original paper.

The activation functions are saturation functions, and the time-varying delay is defined as given in the paper.

The initial history is defined by the initial values of the two state variables over the prescribed initial interval.

## 3. Simulation Programs

The following MATLAB programs are intended to reproduce the numerical simulations presented in Example 2.

| MATLAB file | Description | Paper figure |
|---|---|---|
| `ex2.m` | Simulation of the neural network without control | Figure 4 |
| `ex22.m` | Simulation of the neural network under the feedback controller (33) | Figure 5 |

## 4. Controller Parameters

For the controlled simulation corresponding to Figure 5, the controller parameters are selected according to the values reported in the paper:

- \(k_3 = 18.4800\)
- \(k_4 = 1\)
- \(\mu = 0.5\)
- \(G = 1\)

## 5. Numerical Simulation

The simulations are implemented in MATLAB using numerical methods for delay differential equations.

The purpose of this example is to compare the uncontrolled and controlled responses of the neural network and to illustrate the finite-time stabilization achieved by the proposed controller.

## 6. Notes

The MATLAB source files contain the implementation details, including the system parameters, delay function, activation functions, initial history, and controller equations.

The numerical results should be compared with Figures 4 and 5 of the original paper.
