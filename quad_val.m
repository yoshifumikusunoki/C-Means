function v = quad_val(X,nu) % nu > 0
[n,m] = size(X);
X = X/nu;
[S,I] = sort(X,1,'descend');
T = (1 >= reshape(sum(reshape(max(kron(ones(n,1),S) - kron(S,ones(n,1)),0),[n,n*m]),1),[n,m]));
T(1,:) = true;
J = max(T.*((1:n)'*ones(1,m)),[],1);
mu = (sum(S.*T,1)-1)./J;
Y = zeros(n,m);
Y(sub2ind([n,m],I(:)',kron(1:m,ones(1,n)))) = reshape((S - ones(n,1)*mu).*T,[1,n*m]);
v = nu*(sum(X.*Y,1) - sum(Y.*Y,1)/2);
end
