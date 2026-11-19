function plot_fig5_paper_exact
clc; clear; close all;

%% 1. معاملات النظام (Example 2 - المعادلة 32)
D = diag([1, 1]);
A = [1.8, 1.5;
     0.1, 1.8];
B = [-1.4, 0.1;
      0.1, -1.4];
G = 1;

%% 2. معاملات المتحكم
k3 = 18.4800;
k4 = 1;

%% 3. إعدادات المحاكاة
h = 0.0005;
t_max = 5;
tau_max = 1;

N_hist = round(tau_max / h);
N_sim  = round(t_max / h);
N_tot  = N_hist + N_sim;

t = (-N_hist : N_sim) * h;
x = zeros(2, N_tot + 1);

%% 4. الشروط الابتدائية على الفترة [-1, 0]
x(1, 1:N_hist+1) = -3;
x(2, 1:N_hist+1) =  4;

%% 5. دالة التفعيل وتقريب دالة الإشارة (Boundary Layer)
f = @(s) 0.5 * (abs(s + 1) - abs(s - 1));
delta = 0.01;
smooth_sign = @(s) s ./ (abs(s) + delta);

%% 6. التكامل العددي
for k = (N_hist + 1) : N_tot
    tk = t(k);
    xk = x(:, k);
    
    % التأخير الزمني (tau = 1 أو exp(t)/(1+exp(t)))
    % ملاحظة: في رسمة الورقة قفزت العتبة عند t ~ 1.1 مما يدل على استخدام الحد الأعلى tau = 1
    tau_t = 1.0; 
    idx_delay = k - round(tau_t / h);
    x_delayed = x(:, idx_delay);
    
    sgn_x = smooth_sign(xk);
    
    % التصحيح الجوهري: استخدام abs(B) بدلاً من B لضمان استقرار النظام
    u = -k3 * xk ...
        - abs(B) * G * sgn_x ...
        - k4 * (sgn_x .* sqrt(abs(xk)));
    
    dx = -D * xk + A * f(xk) + B * f(x_delayed) + u;
    x(:, k + 1) = xk + h * dx;
end

%% 7. رسم الشكل 5 مطابقاً للورقة
t_plot  = t(N_hist+1 : end);
x1_plot = x(1, N_hist+1 : end);
x2_plot = x(2, N_hist+1 : end);

figure('Color', 'w');
plot(t_plot, x1_plot, 'r', 'LineWidth', 1.2); hold on;
plot(t_plot, x2_plot, 'b', 'LineWidth', 1.2);

xlabel('time-t');
ylabel('x_1(t) and x_2(t)');
legend('x_1(t)', 'x_2(t)', 'Location', 'northeast');

xlim([0 5]);
ylim([-3 4]);
xticks(0:0.5:5);
yticks(-3:1:4);
box on;
end