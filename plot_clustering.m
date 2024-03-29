load data\norm5.mat

nu = 60;
c = 5;
h = 10;

% max_func.val = @max_val;
% max_func.grad = @max_grad;

% max_func.val = @(X) extnorm_val(X,nu);
% max_func.grad = @(X) extnorm_grad(X,nu);

% max_func.val = @(X) entro_val(X,nu);
% max_func.grad = @(X) entro_grad(X,nu);

max_func.val = @(X) quad_val(X,nu);
max_func.grad = @(X) quad_grad(X,nu);

symb = ['x' '*' '^' '+' 'p'];

best_obj = inf;
best_V = zeros(size(X,2),c);
best_misc = struct();
for i=1:h
    [V,obj,misc] = c_means(X,c,max_func);
    if obj < best_obj
        best_obj = obj;
        best_V = V;
        best_misc = misc;
    end
end
obj = best_obj;
V = best_V;
misc = best_misc;

figure; hold on; axis equal;

for i=1:5
    plot(X(y==i,1),X(y==i,2),symb(i));
end

plot(V(:,1),V(:,2),'o','Color','k','MarkerFaceColor','k','MarkerSize',5);

maxX = max(X(:,1));
minX = min(X(:,1));
z1 = linspace(minX-0.01*(maxX-minX),maxX+0.01*(maxX-minX));
maxX = max(X(:,2));
minX = min(X(:,2));
z2 = linspace(minX-0.01*(maxX-minX),maxX+0.01*(maxX-minX));
[Z1,Z2] = meshgrid(z1,z2);
Z = [Z1(:) Z2(:)];
T = ones(c,1)*sum(Z.^2,2)' - 2*V*Z' + (sum(V.^2,2))*ones(1,size(Z,1));
g = -max_func.val(-T);
contour(Z1, Z2, reshape(g,size(Z1)), 50,':','Color', 'k');


