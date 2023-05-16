function [xNew,yNew] = armijoRule(x,y,d)
    
    alpha   = 0.01; %   Alpha Values between 10^-5 and 0.1
    beta    = 0.3;  %   Beta Values between 0.1 and 0.5
    
    s = 1;
    m = 0;
    
    gammaValue = s * beta^m;
    
    xNew = x + gammaValue * d(1);
    yNew = y + gammaValue * d(2);
    
    v1 = funct(x,y);
    v2 = funct(xNew,yNew);
    
    while (-alpha * (beta^m) * s * d' * fGrad(x,y))>= (v1 - v2) 
    
        m = m + 1;
        gammaValue = s * beta^m;
        
        xNew = x + gammaValue * d(1);
        yNew = y + gammaValue * d(2);
        
        v2= funct(xNew,yNew);
    
    end
    
end