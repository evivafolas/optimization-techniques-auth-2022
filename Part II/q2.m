%%  Project 2
%
%   Dimitrios Folas Demiris, AEM: 9415
%   Optimization Techniques & Algorithms Course 2021-22, ECE AUTh
%   Q2 of 4, Method of Steepest Descent
%
%%  Varaible Clearing

clc
clearvars

%% 3D Plot of the function in question

figure(1)

clf

x = linspace(-3,3,50);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));

surf(x,y,z)

legend('z','dot')

xlabel('x')
ylabel('y')
zlabel('z')

title('3D Plot of f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ ','Interpreter','latex')

%%  Parameter Initiation

x0 = [0, -1, 1];
y0 = [0, -1, 1];
eps = 0.001;

%%  Steepest Descent Method Switch
%
%       The three ways we are implementing the Method of Steepest Descent:
%           with a constant Gamma Value, with an optimal Gamma Value 
%               and with the Armijo rule.
%

i = 2;

% [~, xlist, ylist]   = steepestDescentMethod(eps, x0(i), y0(i));
% [~, xlist, ylist]   = steepestDescentConst(eps, x0(i), y0(i));
% [~, xlist, ylist]   = steepestDescentArmijo(eps, x0(i), y0(i));

%%  Figures of the Results

figure(2)

clf
surf(x,y,z)

hold on
scatter3(xlist, ylist,(xlist.^3).* (exp((-xlist.^2) - (ylist.^4))),'+','r')

hold on 
scatter3(xlist(end), ylist(end), (xlist(end)^3) * (exp((-xlist(end)^2) - (ylist(end)^4))),'p','y')

legend('z','Iteration Steps','Optimal Solution')

xlabel('x')
ylabel('y')
zlabel('z')

% title('f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for the Steepest Descent Method for Gamma = 1 for (1,1)','Interpreter','latex')
% title('f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for the Steepest Descent Method with the Optimal Gamma Value for (-1,-1)','Interpreter','latex')
% title('f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for the Steepest Descent Method with Gamma Value through the Armijo Rule for (-1,-1)','Interpreter','latex')

figure(3)

clf

fcontour(@(x,y) (x^3) * (exp((-x^2) - (y^4))), [-2, 2])
hold on

scatter(xlist,ylist,'+','r')
hold on 

scatter(xlist(end),ylist(end),'p','k')

legend('f(x,y)','Iteration Steps','Optimal Solution')

xlabel('x')
ylabel('y')