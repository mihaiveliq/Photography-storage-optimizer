function [A_k S] = cerinta3(image, k)
  
  A = imread(image);
  A = double(A);
  [m, n] = size(A);
  
  %1.
  miu = ones(1);
  suma = 0;
  for i = 1:m
    suma = 0;
    for j = 1:n   
      suma = suma + A(i,j);
    endfor
    miu(i) = suma/n;
  endfor
  miu = miu';
  
  %2.
  for i = 1:m
    A(i,1:n) = A(i,1:n) - miu(i);
  endfor
  
  %3.
  Z = (A')./sqrt(n-1);
  
  %4.
  [U, S, V] = svd(Z);
  
  %5.
  for i =1:k
    W(:,i) = V(:,i);
  endfor
  
  %6.
  Y = (W') * A;
  
  %7.
  A_k = W * Y + miu;
  
endfunction