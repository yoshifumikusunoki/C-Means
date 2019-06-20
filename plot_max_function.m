nu = 2;

z1 = linspace(-100,0);
z2 = linspace(-100,0);
[Z1,Z2] = meshgrid(z1,z2);
Z = [Z1(:) Z2(:)];
% g = entro_val(Z',nu);
g = extnorm_val(Z',nu);
% g = quad_val(Z',nu);

figure;
contour(Z1, Z2, reshape(g,size(Z1)), 10,'Color', 'k','ShowText','on');
axis equal
