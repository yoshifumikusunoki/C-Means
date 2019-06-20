function [V,obj,misc] = c_means(X,c,fmax_func)

max_itr = 1000;

X = X';
[n,m] = size(X);
xx = sum(X.^2,1);

pre_obj = inf;

rp=randperm(m);

V = X(:,rp(1:c));

T = ones(c,1)*xx - 2*V'*X + (sum(V.^2,1))'*ones(1,m);
U = fmax_func.grad(-T);
obj = -sum(fmax_func.val(-T));

h = 1;

while pre_obj - obj > 1.0e-8*abs(obj) && h < max_itr
    
    pre_obj = obj;
        
    V = X*((U./(sum(U,2)*ones(1,m))).');

    T = ones(c,1)*xx - 2*V'*X + (sum(V.^2,1))'*ones(1,m);
    U = fmax_func.grad(-T);
    obj = -sum(fmax_func.val(-T));
    
    fprintf('%d: %e %e\n',h,pre_obj,obj);

    h = h+1;
end

misc.U = U;
misc.h = h;
V = V';

if h == max_itr
    fprintf('reach max_itr. pre_obj = %f, obj = %f \n',pre_obj,obj);
end
end
