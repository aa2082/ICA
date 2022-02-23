function [L,dtheta] = findL(theta)
    global X
    loga_b = reshape(theta(1:256*256),256,[]);
    loga = loga_b;
    logb = theta(256*256+1:256*257);
    for i=1:256
        loga(i,i) = 0;
    end
    trX2 = transpose(X.^2);
    %size(trX2)
    sigma2 = exp(loga)*trX2 + repmat(exp(logb),1,32000);
    inv_sigma2 = ones(256,32000)./sigma2;

    logp = -0.5*log(2*pi)*ones(256,32000)-0.5*log(sigma2) - 0.5*trX2.*(inv_sigma2.^2);
    L = sum(logp,'all');

    dP_dsig = -0.5*inv_sigma2 + 0.5*trX2.*inv_sigma2;
    dP_db = sum(dP_dsig,2);
    dP_da = dP_dsig*transpose((ones(256)-diag(256))*trX2);
    dtheta = [reshape(dP_da,256*256,1);dP_db];
end