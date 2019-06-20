function v = extnorm_val(X,nu) % nu > 1
xbar = max(X,[],1);
nz = find(xbar < 0);
p = 1/(nu-1)+1;
q = (1-1/p)^(-1);
v = xbar;
v(nz) = -sum((-X(:,nz)).^(-p/q),1).^(-q/p);
end