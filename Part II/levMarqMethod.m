function [res,xlist,ylist] = levMarqMethod(eps,x,y)

kappa = 1;

res = [funct(x,y)];

xlist = [x];
ylist = [y];

d = fGrad(x,y);

while norm(d) >= eps
    
    h = hessianMtx(x,y);
    
    m = 0;
    pM = h + m*eye(size(h)); 
    
    if pM(1,1)<=0 || (pM(1,1) * pM(2,2) - pM(1,2) * pM(2,1)) <= 0
        
        m = m + 0.5;
        pM = h + m * eye(size(h));
        
        if m > 1000
            
            disp('This Hessian Matrix is not positively defined.')
            break
            
        end
    end
    
    dk = -d / pM;
    
    gammaValue = goldenSectionMethod(x,y,dk);
    
    x = x + gammaValue * dk(1);
    y = y + gammaValue * dk(2);
    
    kappa = kappa+1;
    
    res = [res, funct(x,y)];
    
    d = fGrad(x,y);
    
    xlist = [xlist, x];
    ylist = [ylist, y];

end
    
l = length(xlist)

end