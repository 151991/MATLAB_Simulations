# MATLAB Simulations of Delayed Neural Networks

This repository contains MATLAB implementations of numerical simulations for delayed neural networks, based on the following research paper.

## Reference

L. Wang, Y. Shen, and Z. Ding, "Finite time stabilization of delayed neural networks," *Neural Networks*, vol. 70, pp. 74–80, 2015.

## Repository Structure

The MATLAB codes are organized according to the numerical examples presented in the paper.

### Example 1

Includes simulations of the delayed neural network without control and under two finite-time controllers.

- `ex1.m` — Original system without control.
- `ex11.m` — Controller (30), based on Corollary 2.
- `ex111.m` — Switched controller (24), based on Theorem 4.

### Example 2

Includes simulations of the two-dimensional delayed neural network without control and under the feedback controller.

- `ex2.m` — System without control.
- `ex22.m` — System under feedback controller (33).

## Numerical Method

The delay differential equations are solved using MATLAB's `dde23` solver.

## Purpose

The purpose of this repository is to implement, examine, and compare the numerical behavior of delayed neural network models and their controlled responses, corresponding to the examples discussed in the referenced paper.
