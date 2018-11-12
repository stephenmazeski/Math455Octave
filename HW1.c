function[kappa, z,j] =cond2(L,U,p,A)
  
  %% Conditions necessary for code
  %
  %%%%PLUG IN A HERE%%%%%%%%%%%%%%%
  %
  [L,U,p] = lu(A,'vector');
%% discover L, U , p of A
  a=1;
  j=0;
  guessinitial = 0; %%necessary hor higham
  n = size(L,1);
  z = ones(n, 1);
  sign(z) = 1;
%% from hager-higham
  for k = 1:n
    b = sign(z)*(n+k-1)/n;
    sign(z) = - sign(z);
  endfor
  z = z/norm(z, inf);
  %% A while loop is necessary to create the guesses
  while (a<=4)
    y = U'\z;
    w = L'\y;
    %% index function necessary
    index = find(w==max(w));
    j = index;
    ej = zeros(n,1);
    ej(j) = 1
    u = L\ej;
    y = U\u;
    inverse_guessinitial = norm(y,1);    
    %% now check for integrity 
    %% of loop and break if necessary
    if (inverse_guessinitial ~= guessinitial)
      guessinitial = inverse_guessinitial
%% sift for guesses
    else
      break;
    endif
   if (j~=ej)
     j=ej;
   else
     break;
   endif
   %% next test iteration
   a = a+1;
  endwhile
  
  kappa = guessinitial*norm(A,1);
%% return values for answers
  return;
 %%%%%%%%%%%END CODE%%%%%%%%%%
