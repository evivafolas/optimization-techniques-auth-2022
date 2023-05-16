function [j, lim] = dichotomyMethod(a,b,l,e,f)

lim = [];
j   = 0;

while  b-a >= l
    x1 = (a + b)/2 + e;
    x2 = (a + b)/2 - e;
    if funSelect(x2,f) < funSelect(x1,f)
        b = x1;
    else
        a = x2;
    end
    j = j + 1;
    lim = [lim;[a b]];
end
end
