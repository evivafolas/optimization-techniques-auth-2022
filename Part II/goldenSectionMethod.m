function [gammaResult] = goldenSectionMethod(x,y,d)
    
lambda = 0.01;  %   Lambda is the final Search Margin for the Golden Ratio Method

alpha = -4;     %   Alpha is the Upper Bound
beta = 4;       %   Beta is the Lower Bound

gamma = 0.618;

x1 = alpha + (1-gamma)*(beta-alpha);
x2 = alpha + gamma*(beta-alpha);

t1 = optimalGammaFinder(x,y,d,x1);
t2 = optimalGammaFinder(x,y,d,x2);
        
while  beta-alpha >= lambda
    
    if t1 > t2
       alpha = x1;
       x1 = x2;
       x2 = alpha + gamma*(beta-alpha);
       t1 = t2;
       t2 = optimalGammaFinder(x,y,d,x2);
    
    else
        
        beta = x2;
        x2 = x1;
        x1 = alpha + (1 - gamma)*(beta - alpha);
        t2 = t1;
        t1 = optimalGammaFinder(x,y,d,x1);      
    
    end 
end

gammaResult = (alpha + beta)/2; 

end