function example2_phase_fast

clc;
close all;

%% 1. System matrices
D = eye(2);

A = [ 1.8   1.5;
      0.1   1.8];

B = [-1.4   0.1;
       0.1 -1.4];

%% 2. Initial condition and history
x0 = [-3; 4];

%% 3. Simulation settings
T = 300;
h = 0.001;
N = round(T/h);
t = (0:N)*h;

X = zeros(2,N+1);
X(:,1) = x0;

%% 4. Activation function
f = @(z) max(-1, min(1,z));

%% 5. Variable delay
tau = @(tt) exp(tt)./(1 + exp(tt));

%% 6. RK4 integration
for k = 1:N

    tk = t(k);
    xk = X(:,k);

    % RK4 stage 1
    k1 = rhs(tk, xk, X, k, h, D, A, B, f, tau);

    % RK4 stage 2
    x2 = xk + (h/2)*k1;
    k2 = rhs(tk+h/2, x2, X, k, h, D, A, B, f, tau);

    % RK4 stage 3
    x3 = xk + (h/2)*k2;
    k3 = rhs(tk+h/2, x3, X, k, h, D, A, B, f, tau);

    % RK4 stage 4
    x4 = xk + h*k3;
    k4 = rhs(tk+h, x4, X, k, h, D, A, B, f, tau);

    % Update state
    X(:,k+1) = xk + (h/6)*(k1 + 2*k2 + 2*k3 + k4);

end

%% 7. State trajectories
figure;

plot(t, X(1,:), 'LineWidth', 1.2);
hold on;
plot(t, X(2,:), 'LineWidth', 1.2);

grid on;
xlabel('Time t');
ylabel('States');
legend('x_1(t)','x_2(t)');
title('State trajectories - Example 2');

%% 8. Phase plot
figure;

plot(X(1,:), X(2,:), 'LineWidth', 1.2);

grid on;
xlabel('x_1(t)');
ylabel('x_2(t)');
title('Phase plot of system (32), u(t) = 0');

end

%% =========================================================
% Right-hand side of the delayed system
%% =========================================================
function dx = rhs(tt, x, X, k, h, D, A, B, f, tau)

    % Delayed time
    td = tt - tau(tt);

    % Calculate delayed state quickly
    xd = delayed_state_fast(td, X, k, h);

    % System equation
    dx = -D*x + A*f(x) + B*f(xd);

end

%% =========================================================
% Fast interpolation of delayed state
%% =========================================================
function xd = delayed_state_fast(td, X, k, h)

    % Initial history: x(s) = [-3;4], for -1 <= s < 0
    if td < 0
        xd = [-3; 4];
        return;
    end

    % Position of delayed time on the uniform time grid
    p = td/h;

    % Left grid index
    j = floor(p) + 1;

    % Fraction between two grid points
    alpha = p - floor(p);

    % Linear interpolation
    xd = (1-alpha)*X(:,j) + alpha*X(:,j+1);

end