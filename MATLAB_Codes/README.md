
# MATLAB Simulations

## Overview

This folder contains MATLAB implementations of the numerical simulations presented in the research paper:

L. Wang, Y. Shen, and Z. Ding, "Finite time stabilization of delayed neural networks," Neural Networks, vol. 70, pp. 74–80, 2015.

The MATLAB codes are organized according to the numerical examples in the paper.

## Numerical Examples

### Example 1

Contains three MATLAB programs illustrating the delayed neural network without control and under two finite-time controllers.

- `ex1.m`: Original system without control.
- `ex11.m`: Controller (30), based on Corollary 2.
- `ex111.m`: Switched controller (24), based on Theorem 4.

See the [Example 1 folder](Example_1/).

### Example 2

Contains MATLAB programs implementing the numerical simulations presented in Example 2.

- `ex2.m`
- `ex22.m`

See the [Example 2 folder](Example_2/).

## Numerical Method

The delay differential equations are solved using MATLAB's `dde23` solver.

## Purpose

This repository provides numerical implementations to reproduce and examine the simulation results presented in the paper.
