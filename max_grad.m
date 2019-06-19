function Y = max_grad(X)
[n,m] = size(X);
[~,I] = max(X,[],1);
Y = zeros(n,m);
Y(sub2ind([n,m],I,1:m)) = 1;
end
