function [res, xlist, ylist] = steepestDescentMethod(eps,x,y)

kappa = 1;

res = [funct(x,y)];

xlist   = [x];
ylist   = [y];

while norm(fGrad(x,y)) >= eps
    
    d = - fGrad(x,y);
    
    gammaValue = goldenSectionMethod(x,y,d);
    
    x = x + gammaValue*d(1);
    y = y + gammaValue*d(2);  
    
    kappa = kappa + 1;
    res = [res, funct(x,y)];
    
    xlist = [xlist, x];
    ylist = [ylist, y];
end

l = length(xlist);

end