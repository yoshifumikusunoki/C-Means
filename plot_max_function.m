nu = 10;

z1 = linspace(-100,0);
z2 = linspace(-100,0);
[Z1,Z2] = meshgrid(z1,z2);
Z = [Z1(:) Z2(:)];
% g = entro_val(Z',nu);
g = quad_val(Z',nu);

% t = zeros(size(X1));
% for i=1:numel(X1)
%     x = [X1(i);X2(i)];
% %     t(i) = extended_norm(x,nu);
% %     t(i) = max_quad_reg(x,nu);
% %     t(i) = nu*log(sum(exp(x/nu)));
% %     t(i) = max(x);
% %     t(i) = norm(x,nu) + sum(x);
% %     t(i) = max_simplex(x,nu);
% end

figure;
contour(Z1, Z2, reshape(g,size(Z1)), 10,'Color', 'k','ShowText','on');
axis equal
