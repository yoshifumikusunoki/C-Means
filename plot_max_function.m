nu = 60;

x1 = linspace(-100,0);
x2 = linspace(-100,0);
[X1,X2] = meshgrid(x1,x2);
t = zeros(size(X1));
for i=1:numel(X1)
    x = [X1(i);X2(i)];
%     t(i) = extended_norm(x,nu);
%     t(i) = max_quad_reg(x,nu);
%     t(i) = nu*log(sum(exp(x/nu)));
%     t(i) = max(x);
%     t(i) = norm(x,nu) + sum(x);
    t(i) = max_simplex(x,nu);
end

figure;
contour(X1, X2, t, 10,'Color', 'k','ShowText','on');
axis equal
