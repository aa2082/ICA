X = Y*R;

loga_b = ones(256,256);
loga = loga_b;
logb = ones(256,1);
for i=1:256
    loga(i,i) = 0;
    logb(i,1) = loga_b(i,i);
end
trX2 = transpose(X.^2);
sigma2 = exp(loga)*trX2 + repmat(exp(logb),1,32000);
logp = -0.5*log(2*pi)*ones(256,32000)-0.5*log(sigma2) - 0.5*trX2./sigma2;
L = sum(logp,'all');