function [res, xlist, ylist] = newtonMethodArmijo(eps,x,y)

kappa   = 1;
res     = [funct(x,y)];

xlist = [x];
ylist = [y];

d = fGrad(x,y);

while norm(d) >= eps
    
    h = hessianMtx(x,y);
    
    if h(1,1)<0 || h(1,1)*h(2,2)-h(1,2)*h(2,1)<0
        
        disp('The Hessian Matrix is not positively defined.')
        
        break
    end
    
    dk = -h' * d;
    [x,y] = armijoRule(x,y,dk);

    kappa = kappa + 1;
    res = [res, funct(x,y)];
    
    d = fGrad(x,y); 
    
    xlist = [xlist, x];
    ylist = [ylist, y];
    
end
end