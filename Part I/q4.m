%%  Project 1
%
%   Dimitrios Folas Demiris, AEM: 9415
%   Optimization Techniques & Algorithms Course 2021-22, ECE AUTh
%   Q4 of 4 - Utilization of the Dichotomy Method while using Derivatives
%

%%

a = -4;
b = 4;
e = 0.001;
funNo = 3;

%%  Function Selection
% 
% if funNo == 1
%         funct = (x-3)^2+(sin(x+3))^2;
%         
% %         fplot(@(x) ((x-3)^2+(sin(x+3))^2), [-4,4]);
% %         grid on
% %         title('f1(x) = (x-3)^2+(sin(x+3))^2 , [-4,4]')
% %         xlabel('x');
% %         ylabel('y');
%         
%     elseif funNo == 2
%         funct = (x-1)*cos(x/2)+x^2; 
%         
% %         fplot(@(x) ((x-1)*cos(x/2)+x^2), [-4,4])
% %         grid on
% %         title('f2(x) = (x-1)*cos(x/2)+x^2 , [-4,4]')
% %         xlabel('x');
% %         ylabel('y');
%         
%     elseif funNo == 3
%         funct = (x+2)^2 + exp(x-2)*sin(x+3);
%         
% %         fplot(@(x) ((x+2)^2 + exp(x-2)*sin(x+3)), [-4,4])
% %         grid on
% %         title('f3(x) = (x+2)^2 + exp(x-2)*sin(x+3) , [-4,4]')
% %         xlabel('x');
% %         ylabel('y');
% end

% %%  Function Derivative Selection
% 
% %   FunctionNumber1 = (x-3)^2 + (sin(x+3))^2;
% if funNo == 1
%     funDer = 2*(x-3)^(2-1) + 2*(sin(x+3)^(2-1))*cos(x+3);
%                 
% %   FunctionNumber2 = (x-1) * cos(0.5 * x) + x^2   
%     elseif funNo == 2
%         funDer = cos(0.5*x) - (x-1) * sin(0.5*x)*0.5 + 2 * x^(2-1);
%         
% %   FunctionNumber3 = (x+2)^2 + e^(x - 2) * sin(x + 3)
%     elseif funNo == 3
%         funDer = 2 * (x+2)^(2-1) + exp(x-2) * sin(x+3) + exp(x-2) * cos(x+3);
% end
%%

k = zeros([91 1]);
limits = zeros([91 2]);

for l = 10e-3 : 1e-3 : 100e-3
    [kTemp, limit] = derivativeMethod(a,b,l,funNo);
    k(round((l-9e-3)/(1e-3))) = kTemp;
    limits(round((l-9e-3)/(1e-3)), 1) = limit(kTemp,1);
    limits(round((l-9e-3)/(1e-3)), 2) = limit(kTemp,2);
end

%%

figure(410+funNo)
clf
X = 10e-3:1e-3:100e-3;

Y = k;

plot(X * 100, Y,'LineWidth',3);
xlabel('l 10$^-1$','Interpreter','latex')
ylabel('Complexity - Function Calls')
title('Function calls per l of the Dichotomy Method using Derivatives')

%%

%	 Selection for lamba value: l = [10e-3, 25e-3, 100e-3]

lambda_plot = [10e-3 25e-3 100e-3];

[~, edge1] = derivativeMethod(a,b,lambda_plot(1),funNo);
edge1 = [-4 4;edge1];
[~, edge2] = derivativeMethod(a,b,lambda_plot(2),funNo);
edge2 = [-4 4;edge2];
[~, edge3] = derivativeMethod(a,b,lambda_plot(3),funNo);
edge3 = [-4 4;edge3];

%%

figure(420 + funNo)
clf
plot(edge1)
hold on
plot(edge2)
hold on
plot(edge3)

legend('limits for l = 10$^-2$','limits for l = 2.5 $10^-2$ ','limits for l = 10$^-1$','Interpreter','latex')
xlabel('Function Calls')
ylabel(sprintf('Value of Function f%d', funNo))
title('Limits a and b of the calls of the Dichotomy Method using Derivatives')