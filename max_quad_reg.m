function p = max_quad_reg(t,nu)
nu = nu;
n = numel(t);
t = t/nu;
[ts,t_i] = sort(t,'descend');

i = 1;
while i+1 <= n && sum(max(t-ts(i+1),0)) <= 1
    i = i+1;
end
mu = (sum(ts(1:i))-1)/i;

u = zeros(n,1);
u(t_i(1:i)) = t(t_i(1:i)) - mu;
p = nu*(t.'*u - u.'*u/2);
% j
% u
% u-t+mu
end