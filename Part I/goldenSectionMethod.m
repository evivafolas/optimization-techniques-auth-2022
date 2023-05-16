function [j,lim] = goldenSectionMethod(a,b,l,f)

lim = []; 
j = 0;
phi = 0.618; 

while  b-a >= l
    x1 = a + phi*(b-a);
    x2 = a + (1-phi)*(b-a);
    
    if funSelect(x1,f) > funSelect(x2,f)
        b = x1;
    else
        a = x2;
    end
    j = j +1;
    lim = [lim;[a b]];
end
end