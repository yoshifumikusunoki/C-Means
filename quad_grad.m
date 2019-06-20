function Y = quad_grad(X,nu)
[n,m] = size(X);
X = X/nu;
[S,I] = sort(X,1,'descend');
T = (1 >= reshape(sum(reshape(max(kron(ones(n,1),S) - kron(S,ones(n,1)),0),[n,n*m]),1),[n,m]));
J = max(T.*((1:n)'*ones(1,m)),[],1);
mu = (sum(S.*T,1)-1)./J;
Y = zeros(n,m);
Y(sub2ind([n,m],I(:)',kron(1:m,ones(1,n)))) = reshape((S - ones(n,1)*mu).*T,[1,n*m]);

% i = 1;
% while i+1 <= n && sum(max(S(:,j)-S(i+1,j),0)) <= 1
%     i = i+1;
% end
% mu = (sum(S(1:i,j))-1)/i;
% 
% u = zeros(n,1);
% u(t_i(1:i)) = t(t_i(1:i)) - mu;
% p = nu*(t.'*u - u.'*u/2);
% % j
% % u
% % u-t+mu
end
