function Y = entro_grad(X,nu) % nu > 0
[n,m] = size(X);
Y = (reshape(sum(reshape(exp((kron(ones(n,1),X)-kron(X,ones(n,1)))/nu),[n,n*m]),1),[n,m])).^(-1);
Y(Y<1e-9) = 0;
end
