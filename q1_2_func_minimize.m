global X
X = Y*R;
theta = ones(256*257,1);
%[outX, fX, i]  = minimize(theta,@findL,-5);
%[L,dtheta] = findL(theta);
%e = 0.01*theta;
%checkgrad('findL',theta,1e-5)
e = 1e-7;
Ls = [];
for i=1:100
    [L,dtheta] = findL(theta);
    L
    Ls = [Ls,L];
    %if i>10 & Ls(end)-Ls(end-1)>=0
    %    e = 0.01*e
    %end
    theta = theta+e*dtheta;
end

%fminsearch(@findL,theta)