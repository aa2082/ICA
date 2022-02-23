function L = prop(X)

    for i=1:256
        X.a(i,i) = 0;
    end
    
    sig2 = X.a*x.^2 + X.b;
    L = (1/sqrt(2*pi*sig2)) * exp(x.^2/(2*sig2));
end