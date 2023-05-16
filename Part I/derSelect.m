function funder = derSelect(x,funNo)
    
    %   FunctionNumber1 = (x-3)^2 + (sin(x+3))^2;
    if funNo == 1
        funder = 2*(x-3)^(2-1) + 2*(sin(x+3)^(2-1))*cos(x+3);
                
    %   FunctionNumber2 = (x-1) * cos(0.5 * x) + x^2   
    elseif funNo == 2
        funder = cos(0.5*x) - (x-1) * sin(0.5*x)*0.5 + 2 * x^(2-1);
        
    %   FunctionNumber3 = (x+2)^2 + e^(x - 2) * sin(x + 3)
    elseif funNo == 3
        funder = 2 * (x+2)^(2-1) + exp(x-2) * sin(x+3) + exp(x-2) * cos(x+3); 
    end
end
