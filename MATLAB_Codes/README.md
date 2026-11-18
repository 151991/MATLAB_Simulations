
# MATLAB Simulations – Example 1

## Overview

This repository contains MATLAB implementations of the numerical simulations presented in Example 1 of a research paper on finite-time stabilization of delayed neural networks.

The example considers a two-dimensional delayed neural network with constant time delay.

## System Parameters

- D = diag(1,1)
- A = [2, -0.1; -5, 4.5]
- B = [-1.5, -0.1; -0.2, -4]
- Time delay: tau = 1
- Activation functions: tanh(x)
- Initial history: x1(s) = -1.6, x2(s) = 1.2

## MATLAB Programs

### 1. ex1.m – Original System Without Control

Simulation of the original delayed neural network without control.

Corresponding figure: Fig. 1.

### 2. ex11.m – Controller (30)

Finite-time stabilization using controller (30), according to Corollary 2.

Corresponding figure: Fig. 2.

### 3. ex111.m – Switched Controller (24)

Finite-time stabilization using the switched controller (24), according to Theorem 4.

Corresponding figure: Fig. 3.

## Numerical Method

The delay differential equations are solved using MATLAB's `dde23` solver.

## Purpose

The programs illustrate the numerical behavior of the delayed neural network under the three simulation cases presented in Example 1.
