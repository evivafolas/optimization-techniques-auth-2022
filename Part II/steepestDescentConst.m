function [res, xlist, ylist] = steepestDescentConst(eps,x,y)

%  Parameter Specification

kappa   = 1;
res = [funct(x,y)];

gammaValue = 1.2;

xlist  = [x];
ylist  = [y];

while norm(fGrad(x,y)) >= eps
    
    d = - fGrad(x,y);
    x = x + gammaValue * d(1);
    y = y + gammaValue * d(2);  
    
    kappa = kappa + 1;
    
    res = [res, funct(x,y)];
    
    xlist  = [xlist, x];
    ylist  = [ylist, y];
    
end

l = length(xlist)

end