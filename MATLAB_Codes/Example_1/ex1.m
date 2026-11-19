
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

%% Constant time delay

tau = 1;

%% Initial history

history = @(t) [-1.6; 1.2];

%% Delayed neural network without control

dde = @(t,x,Z) ...
    -D*x + A*tanh(x) + B*tanh(Z(:,1));

%% Numerical simulation

T = 100;

options = ddeset('RelTol',1e-8, ...
    'AbsTol',1e-10, ...
    'MaxStep',0.02);

sol = dde23(dde,tau,history,[0 T],options);

%% Evaluate the solution

t = linspace(0,T,20000);

X = deval(sol,t);

x1 = X(1,:);
x2 = X(2,:);

%% Phase plot: Fig. 1

figure;

plot(x1,x2,'b','LineWidth',0.7);

xlabel('x_1(t)');
ylabel('x_2(t)');

title('Phase plot without control');

axis([-2 1 -8 6]);

set(gca,'XTick',-2:0.5:1);
set(gca,'YTick',-8:2:6);

box on;
grid off;

%% Initial point

hold on;
plot(-1.6,1.2,'ro','MarkerFaceColor','r');
