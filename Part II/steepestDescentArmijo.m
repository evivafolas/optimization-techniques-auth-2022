function [res, xlist, ylist] = steepestDescentArmijo(eps,x,y)

kappa = 1;

res = [funct(x,y)];

xlist  = [x];
ylist  = [y];

while norm(fGrad(x,y)) >= eps
    
    d       = -fGrad(x,y);
    [x,y]   = armijoRule(x,y,d);  
    
    kappa = kappa + 1;
    
    res = [res, funct(x,y)];
    
    xlist = [xlist, x];
    ylist = [ylist, y];
    
end 

l = length(xlist)

end