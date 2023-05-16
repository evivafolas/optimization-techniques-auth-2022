function [res,xlsit,ylist] = levMarqMethodArmijo(eps,x,y)

kappa = 1;

res = [funct(x,y)];

xlsit = [x];
ylist = [y];

d = fGrad(x,y);

while norm(d) >= eps
    
    h = hessianMtx(x,y);
    
    m = 0;
    pM = h + m*eye(size(h)); 
    
    if pM(1,1)<=0 || (pM(1,1) * pM(2,2) - pM(1,2) * pM(2,1)) <= 0
        
        m = m + 1;
        pM = h + m * eye(size(h));
        
        if m > 1000
            
            disp('This Hessian Matrix is not positively defined.')
            break
            
        end
    end
    
    dk = -d/pM
    [x,y] = armijoRule(x,y,dk);
    
    kappa = kappa + 1;
    res = [res, funct(x,y)];
    
    d = fGrad(x,y); 
    
    xlsit = [xlsit, x];
    ylist = [ylist, y];
end

l = length(xlsit)

end
