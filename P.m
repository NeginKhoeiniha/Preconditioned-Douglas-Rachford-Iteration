function p=P(u)
% norm_u=(u(:,:,1) .^2 + u(:,:,2) .^2).^(0.5);
norm_u=(sum(u.^2,'all'))^(1/2);
[n,m,z]=size(u);
one=ones(n,m);
p=u ./ max(one,norm_u*10);