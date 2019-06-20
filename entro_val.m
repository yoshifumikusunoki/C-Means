function v = entro_val(X,nu) % nu > 0
[n,~] = size(X);
maxX = max(X,[],1);
X = X - ones(n,1)*maxX;
v = nu*log(sum(exp(X/nu),1)) + maxX;
end
