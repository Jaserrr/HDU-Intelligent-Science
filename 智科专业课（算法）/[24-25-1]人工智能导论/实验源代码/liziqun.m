clc; clear; close all;

% 定义变量范围
x1 = linspace(-5, 5, 100);
x2 = linspace(-5, 5, 100);
[X1, X2] = meshgrid(x1, x2);

% 定义目标函数
f = @(x1, x2) 15 + x1.^2 + x2.^2 - 10 * (cos(2 * pi * x1) + cos(2 * pi * x2));
Z = f(X1, X2);

% 绘制三维曲面图
figure;
surf(X1, X2, Z);
title('三维曲面图');
xlabel('x1'); ylabel('x2'); zlabel('f(x1, x2)');
shading interp;
colorbar;

% 绘制二维等高线图
figure;
contourf(X1, X2, Z, 20);
title('二维等高线图');
xlabel('x1'); ylabel('x2');
colorbar;

% 粒子群算法求最小值
options = optimoptions('particleswarm', 'SwarmSize', 50, 'MaxIterations', 200);
objFunc = @(x) 15 + x(1)^2 + x(2)^2 - 10 * (cos(2 * pi * x(1)) + cos(2 * pi * x(2)));
lb = [-5, -5]; % 下界
ub = [5, 5];   % 上界
[bestSolMin, minVal] = particleswarm(objFunc, 2, lb, ub, options);

% 粒子群算法求最大值
objFuncMax = @(x) -(15 + x(1)^2 + x(2)^2 - 10 * (cos(2 * pi * x(1)) + cos(2 * pi * x(2))));
[bestSolMax, maxValNeg] = particleswarm(objFuncMax, 2, lb, ub, options);
maxVal = -maxValNeg; % 恢复最大值

% 打印结果
fprintf('函数的最小值为：%.4f，出现在点 (x1, x2) = (%.4f, %.4f)\n', minVal, bestSolMin(1), bestSolMin(2));
fprintf('函数的最大值为：%.4f，出现在点 (x1, x2) = (%.4f, %.4f)\n', maxVal, bestSolMax(1), bestSolMax(2));