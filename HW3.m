function [x,R,err,N] = rmbrg(f,a,b,tol,K)

f=inline('4./(1.+x.*x);','x');
a=0;
b=1;
tol = 1^(-14);
h = b - a; N = 1;
if nargin < 5, K = 10; end
R(1,1) = h/2*(feval(f,a)+ feval(f,b));
for k = 2:K
  h = h/2; N = N*2;
  R(k,1) = R(k - 1,1)/2 + h*sum(feval(f,a +[1:2:N - 1]*h));
  t = 1;
  for n = 2:k
    t = t*4;
    R(k,n) = (t*R(k,n - 1)-R(k - 1,n - 1))/(t - 1); 
  end
  err = abs(R(k,k - 1)- R(k - 1,k - 1))/(t - 1); 
  if err < tol, break; end
end
x = R(k,k);
