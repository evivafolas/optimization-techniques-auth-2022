function optGamma = optimalGammaFinder(x,y,d,gamma)

syms optg

x1 = x + optg * d(1);
y1 = y + optg * d(2);

f = (x1^3) * exp(-x1^2 - y1^4);

optGamma = vpa(subs(f,optg,gamma));

end