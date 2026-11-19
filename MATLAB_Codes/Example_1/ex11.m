
clear;
clc;
close all;

%% Matrices from Example 1

D = [1 0;
    0 1];

A = [ 2  -0.1;
    -5   4.5];

B = [-1.5  -0.1;
    -0.2  -4];

L = eye(2);

%% Constant time delay

tau = 1;

%% Initial history

history = @(t) [-1.6; 1.2];

%% Controller parameters from the paper

p = 0.0258;
epsilon = 0.6905;
k = 0.8269;

k1 = (1/p)*k;
k2 = 1;

%% Delayed neural network with controller (30)

dde = @(t,x,Z) ...
    -D*x ...
    + A*tanh(x) ...
    + B*tanh(Z(:,1)) ...
    - k1*x ...
    - B*L*(sign(x).*abs(Z(:,1))) ...
    - k2*(sign(x).*sqrt(abs(x)));

%% Numerical simulation

T = 10;

options = ddeset('RelTol',1e-8, ...
    'AbsTol',1e-10, ...
    'MaxStep',0.02);

sol = dde23(dde,tau,history,[0 T],options);

%% Evaluate the solution

t = linspace(0,T,5000);

X = deval(sol,t);

x1 = X(1,:);
x2 = X(2,:);

%% State trajectories: Fig. 2

figure;

plot(t,x1,'b','LineWidth',1.2);
hold on;

plot(t,x2,'r','LineWidth',1.2);

xlabel('Time t');
ylabel('State variables');

title('State trajectories with controller (30)');

legend('x_1(t)','x_2(t)','Location','best');

grid on;
box on;
