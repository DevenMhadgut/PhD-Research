function [A,B,C,E] = bf_realization(bf,p)

% assemble barycentric coefficients at specified parameter values
ap = bf.denom_coefs;
bp = bf.num_coefs;
for j = 2:bf.num_vars
    C = cauchy_mat(bf.itpl_nodes{j}.',p(j-1)).';
    ap = ttm(ap,C,j);
    bp = ttm(bp,C,j);
end

% compute system matrix pencil
alpha = double(ap);
beta = double(bp);
sigma = bf.itpl_nodes{1};

n = length(alpha);

E = zeros(n);
E(1:end-1,1) = ones(n-1,1);
E(1:end-1,2:end) = -eye(n-1);

A = zeros(n);
A(1:end-1,1) = sigma(1);
A(1:end-1,2:end) = -diag(sigma(2:end));
A(end,:) = alpha;

B = zeros(n,1);
B(end) = -1;

C = conj(beta);

end

