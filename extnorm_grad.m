function Y = extnorm_grad(X,nu)
[n,m] = size(X);
[xbar,I] = max(X,[],1);
if nu == 1
%     v = xbar;
    Y = zeros(n,m);
    Y(sub2ind([n,m],I,1:m)) = 1;
else
    nz = find(xbar < 0);
    p = 1/(nu-1)+1;
    q = (1-1/p)^(-1);
    v = xbar;
    v(nz) = -sum((-X(:,nz)).^(-p/q),1).^(-q/p);
    Y = zeros(n,m);
    Y(sub2ind([n,m],I(nz),nz)) = 1;
    Y(:,nz) = (-X(:,nz)).^(-p).*(ones(n,1)*((-v(nz)).^p));
end
% if x == 0 || nu == 1
%     v = x;
% %     u = zeros(size(t));
% %     u(i) = 1;
% else
%     p = 1/(nu-1)+1;
%     q = (1-1/p)^(-1);
%     v = -(sum((-t).^(-p/q)))^(-q/p);
% %     u = (-t).^(-p)*(-v)^(p);
% end
end