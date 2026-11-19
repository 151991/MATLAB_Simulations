Create Example 2 folder and documentation
# Example 2 – Finite-Time Stabilization of Delayed Neural Networks

## 1. Overview

This folder contains the MATLAB implementations of the numerical simulations presented in Example 2 of the research paper:

**L. Wang, Y. Shen, and Z. Ding, "Finite time stabilization of delayed neural networks," Neural Networks, vol. 70, pp. 74–80, 2015.**

The example investigates the finite-time stabilization of a two-dimensional delayed neural network with a time-varying delay and saturation activation functions.

## 2. Simulation Programs

The following MATLAB programs are intended to reproduce the numerical results presented in the paper.

| MATLAB file | Description | Corresponding figure |
|---|---|---|
| `ex2.m` | Neural network without control | Figure 4 |
| `ex22.m` | Neural network with feedback controller (33) | Figure 5 |

## 3. Controller Parameters

For the controlled simulation (Figure 5), the parameters are selected according to the paper:

- \(k_3 = 18.4800\)
- \(k_4 = 1\)
- \(\mu = 0.5\)
- \(G = 1\)

## 4. Numerical Method

The simulations are implemented in MATLAB using a numerical solver for delay differential equations.

## 5. Purpose

These programs illustrate the behavior of the delayed neural network without control and its finite-time stabilization under the proposed feedback controller.

The implementation details, including the system matrices, delay function, activation functions, initial conditions, and controller equations, are provided in the MATLAB source files.
