function [A_k S] = cerinta4(image, k)
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
  Z = 1 /(n-1) * A * (A');
  
  %4.
  [V S] = eig(Z);
  
  %5.
  for i = 1:m
    W(i,:) = V(i,1:k);
  endfor
  
  %6.
  Y = (W') * A;
  
  %7.
  A_k = W * Y + miu;
  
endfunction