function [j,lim] = derivativeMethod(a,b,l,f)

lim = []; 
j   = 0;
m   = 0;

while (0.5)^m > l/(b-a)
    m = m + 1;
end

for i = 1 : 1 : m
    j = i;
    x = (a + b) / 2;
    d = derSelect(x,f);
    if d == 0
        i = m; 
    elseif d > 0
        b   = x;
        lim = [lim;[a b]];
    else 
        a   = x;
        lim = [lim;[a b]];
    end   
end
end
