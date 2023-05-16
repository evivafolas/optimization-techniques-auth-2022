function fun_grad  = fGrad(x0,y0)
    
    syms x y
    
    fv = (x^3)*exp(-x^2-y^4);
    f1 = jacobian(fv,[x,y]);
    
    fun_grad = vpa(subs(f1,[x,y],[x0,y0]));
    
end
