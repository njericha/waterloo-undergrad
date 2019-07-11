function xk = findroot(guess)
% Finds the root of a function y=f(x) using Newton's method

tol = 10^(-9); %the tolerence, how accurate we want our answer to be
maxk = 100; %maximum itteration count
k = 0;
q = 0;
xkm2 = guess; %x_(k-2)
xkm1 = guess; %x_(k-1)
xk   = guess; %x_k

%print the zero'th itteration first
formatSpec = 'k = %i | x = %f | f(x) = %f | q = %f\n';
fprintf(formatSpec,[k,xk,f(xk),q])
k=k+1;

%loop until within tolerence or max itterations it met
while k <= maxk
  xkm2 = xkm1;
  xkm1 = xk;
  xk   = xkm1 - f(xkm1) / fprime(xkm1);
  
  %note the q formula is not defined for k<2 since x for k<0 is not defined
  if k>=2
    q = log(f(xk)/f(xkm1))/log(f(xkm1)/f(xkm2));
  else
    q=0;
  end
  
  fprintf(formatSpec,[k,xk,f(xk),q])
  k = k+1;
  
  %check if we are close enough to zero
  if abs(xk - xkm1) < tol
    break
  end
 
end

end

function y = f(x)
  %The function we are trying to find the root of

y = tan(x./4) - 1;

end

function z = fprime(x)
  %The derivative of the function we are trying to find the root of
  
z = sec(x./4).^2 ./4;

end