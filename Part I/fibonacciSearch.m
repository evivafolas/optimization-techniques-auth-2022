function [returnV,lim] = fibonacciSearch(a,b,l,f)

lim = [];
j   = 0;
i   = 0;

while  fibonacci(i) < (b - a) / l
    i = i + 1 ;   
end

for j = 1:1:(i-1)
    
    x1 = a + fibonacci(i - j)/fibonacci(i - j + 1) * (b-a);
    x2 = a + fibonacci(i - j - 1)/fibonacci(i - j + 1) * (b-a);
    
    if j == i - 1
        x2 = a + fibonacci(i - j) / fibonacci(i - j + 1) * (b - a) + 0.001;
    end
    
    if funSelect(x2,f) < funSelect(x1,f)
        b = x1;
    else
        a = x2;
    end
    lim = [lim;[a b]];
end

returnV = i-1;
end