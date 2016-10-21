function y = sgmd(a,x)
    y = inv(1+exp(-a*x));
end