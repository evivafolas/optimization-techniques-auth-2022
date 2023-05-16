%%  Project 1
%
%   Dimitrios Folas Demiris, AEM: 9415
%   Optimization Techniques & Algorithms Course 2021-22, ECE AUTh
%   Q3 of 4 - Utilization of the Fibonacci Method
%

%%

a = -4;
b = 4;

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

%%

k3 = zeros([9 1]);
lims = zeros([9 2]);

for l = 10e-3 : 1e-3 : 20e-3
    [kTemp, limit] = fibonacciSearch(a,b,l,funNo);
    k3(round((l-9e-3)/(1e-3))) = kTemp;
    lims(round((l-9e-3)/(1e-3)), 1) = limit(kTemp,1);
    lims(round((l-9e-3)/(1e-3)), 2) = limit(kTemp,2);
end

%%

figure(310 + funNo)
clf

X = 10e-3 : 1e-3 : 20e-3;
Y = k3;
plot(X * 100,Y,'r');
xlabel('l 10$^-1$','Interpreter','latex')
ylabel('Complexity - Calls')
title('Calls per l of the Fibonacci Method')

%%

%   Selection for lamba value: l = [10e-3, 25e-3, 100e-3]

lambda = [10e-3 15e-3 20e-3];

[~, edge1] = fibonacciSearch(a,b,lambda(1),funNo);
edge1 = [-4 4;edge1];
[~, edge2] = fibonacciSearch(a,b,lambda(2),funNo);
edge2 = [-4 4;edge2];
[~, edge3] = fibonacciSearch(a,b,lambda(3),funNo);
edge3 = [-4 4;edge3];

%%

figure(320 + funNo)
clf
plot(edge1)
hold on
plot(edge2)
hold on
plot(edge3)
hold on

legend('Limit when l= 10$^-2$','Limit when l=1.5 $10^-2$ ','Limit when l= 2$^-2$','Interpreter','latex')
xlabel('Calls')
ylabel(sprintf('Value of Function f%d', funNo))
title('Limits a and b of the calls of the Fibonacci Method')