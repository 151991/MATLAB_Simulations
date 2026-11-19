
function ex111

clc;
close all;

%% 1. Matrices from Example 1

D = eye(2);

A = [ 2  -0.1;
     -5   4.5];

B = [-1.5  -0.1;
     -0.2  -4];

L = eye(2);

%% 2. Constant time delay

tau = 1;

%% 3. Initial history

phi = [-1.6; 1.2];

history = @(t) phi;

%% 4. Controller parameters

k1 = 32.0825;
k2 = 1;

%% 5. Calculate mu_star

norm_phi = norm(phi,2);

if norm_phi > exp(1)
    mu_star = 1 - 1/log(norm_phi);
else
    mu_star = 0;
end

fprintf('Initial norm = %.4f\n',norm_phi);
fprintf('mu_star = %.4f\n',mu_star);

%% 6. Define delayed system

dde = @(t,x,Z) switched_rhs( ...
    x,Z,D,A,B,L,k1,k2,mu_star);

%% 7. Numerical simulation

T = 3;

options = ddeset( ...
    'RelTol',1e-6, ...
    'AbsTol',1e-8, ...
    'MaxStep',0.02);

fprintf('Starting dde23 solver...\n');

tic;

sol = dde23(dde,tau,history,[0 T],options);

elapsed = toc;

fprintf('Solver finished in %.2f seconds.\n',elapsed);
fprintf('Number of solution points: %d\n',length(sol.x));

%% 8. Evaluate solution

t = linspace(0,T,3000);

X = deval(sol,t);

x1 = X(1,:);
x2 = X(2,:);

%% 9. Estimate settling time numerically

tolerance = 1e-4;

settling_index = find( ...
    abs(x1) < tolerance & abs(x2) < tolerance,1,'first');

if isempty(settling_index)

    fprintf('Settling threshold was not reached.\n');

else

    fprintf('First time both states enter tolerance = %.6f\n', ...
        t(settling_index));

end

%% 10. Print selected values

fprintf('\nState values:\n');

sample_times = [0 0.5 1 1.5 1.669 2 2.5 3];

for q = sample_times

    [~,idx] = min(abs(t-q));

    fprintf('t = %.3f : x1 = %.8f, x2 = %.8f\n', ...
        t(idx),x1(idx),x2(idx));

end

%% 11. Plot state trajectories

figure('Color','w');

plot(t,x1,'r','LineWidth',1.3);
hold on;

plot(t,x2,'b','LineWidth',1.3);

xlabel('Time t');
ylabel('State variables');

title('State trajectories under switched controller (24)');

legend('x_1(t)','x_2(t)','Location','best');

xlim([0 T]);

grid on;
box on;

%% 12. Final values

fprintf('\nFinal values:\n');
fprintf('Final x1 = %.10f\n',x1(end));
fprintf('Final x2 = %.10f\n',x2(end));

end


%% Switched controller (24)

function dx = switched_rhs(x,Z,D,A,B,L,k1,k2,mu_star)

    delayed_x = Z(:,1);

    % Common control term

    common_control = ...
        -k1*x ...
        -B*L*(sign(x).*abs(delayed_x));

    % Switched control term

    if norm(x,2) > exp(1)

        final_control = ...
            -k2*(sign(x).*abs(x).^mu_star);

    else

        final_control = ...
            -k2*sign(x);

    end

    % Total control input

    u = common_control + final_control;

    % Original delayed neural network

    dx = -D*x ...
         + A*tanh(x) ...
         + B*tanh(delayed_x) ...
         + u;

end
