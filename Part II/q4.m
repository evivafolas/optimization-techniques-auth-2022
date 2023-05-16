%%  Project 2
%
%   Dimitrios Folas Demiris, AEM: 9415
%   Optimization Techniques & Algorithms Course 2021-22, ECE AUTh
%   Q4 of 4, Levenberg & Maquardt Method
%
%%  Varaible Clearing

clc
clearvars

%%  Parameter Initiation

x0 = [0, -1, 1];
y0 = [0, -1, 1];
eps = 0.001;

%%  Levenberg & Marquardt Method Switch
%
%       The three ways we are implementing the Levenberg & Marquardt Method:
%           with a constant Gamma Value, with an optimal Gamma Value and
%               with the Armijo rule.
%

i = 2;

% [~, xlist, ylist]   = levMarqMethod(eps, x0(i), y0(i));
[~, xlist, ylist]   = levMarqMethodConst(eps, x0(i), y0(i));
% [~, xlist, ylist]   = levMarqMethodArmijo(eps, x0(i), y0(i));

%%  Figures of the Results

figure(2)

x = linspace(-3,3,30);
y = x';
z = (x.^3).*(exp((-x.^2)-(y.^4)));

clf
surf(x,y,z)

hold on
scatter3(xlist, ylist,(xlist.^3).* (exp((-xlist.^2) - (ylist.^4))),'+','r')

hold on 
scatter3(xlist(end), ylist(end), (xlist(end)^3) * (exp((-xlist(end)^2) - (ylist(end)^4))),'p','y')

legend('f(x,y)','Iteration Steps','Optimal Solution')

xlabel('x')
ylabel('y')
zlabel('z')

title('f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for the Levenberg-Maquardt Method for Gamma = 0.25 for (1,1)','Interpreter','latex')
% title('f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for the Levenberg-Maquardt Method for Optimal Gamma Value for (1,1)','Interpreter','latex')
% title('f(x,y) = $x^{3} * e^{-x^{2} - y^{4}}$ with steps for the Levenberg-Maquardt Method with Gamma Value through the Armijo Rule for (-1,-1)','Interpreter','latex')

figure(3)

clf

fcontour(@(x,y) (x^3) * (exp((-x^2) - (y^4))), [-2, 2])
hold on

scatter(xlist,ylist,'+','r')
hold on 

scatter(xlist(end),ylist(end),'p','k')

legend('z','Iteration Steps','Optimal Solution')

xlabel('x')
ylabel('y')