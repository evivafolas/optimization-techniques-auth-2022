%%  Project 1
%
%   Dimitrios Folas Demiris, AEM: 9415
%   Optimization Techniques & Algorithms Course 2021-22, ECE AUTh
%   Q2 of 4 - Utilization of the Golden - Section Method
%

%%

a = -4;
b = 4;
e = 0.001;

funNo = 3;

%%  Function Selection

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

%%

k2 = zeros([91 1]);
limits = zeros([91 2]);



for l = 10e-3 : 1e-3 : 100e-3
    [k, limit] = goldenSectionMethod(a,b,l,funNo);
    k2(round((l-9e-3)/(1e-3))) = k;
    limits(round((l-9e-3)/(1e-3)), 1) = limit(k,1);
    limits(round((l-9e-3)/(1e-3)), 2) = limit(k,2);
end

figure(210 + funNo)
clf
X = 10e-3 : 1e-3 : 100e-3;
Y = k2;
plot(X * 100, Y,'r');
xlabel('l = 10$^-1$','Interpreter','latex')
ylabel('Complexity - Calls of the Function')
title('Function Calls per l of the Golden - Section Method')

%%

% Selection for lamba value: l = [10e-3, 25e-3, 100e-3]

lambda_plot = [10e-3 25e-3 100e-3];

[~, edge1] = goldenSectionMethod(a,b,lambda_plot(1),funNo);
edge1 = [-4 4;edge1];
[~, edge2] = goldenSectionMethod(a,b,lambda_plot(2),funNo);
edge2 = [-4 4;edge2];
[~, edge3] = goldenSectionMethod(a,b,lambda_plot(3),funNo);
edge3 = [-4 4;edge3];

%%

figure(220 + funNo)
clf
plot(edge1)
hold on
plot(edge2)
hold on
plot(edge3)


legend('Limit when lambda = 10$^-2$','Limit when lambda = 2.5 x $10^-2$ ','Limit when lambda = 10$^-1$','Interpreter','latex')
xlabel('Function Calls','Interpreter','latex')
ylabel(sprintf('Value of Function f%d', funNo))
title('Limits a and b of the calls of Golden - Section Method')