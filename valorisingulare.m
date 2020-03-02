function [vals, m, n, A] = valorisingulare(image)
   A = imread(image);
   A = double(A);
   vals = svd(A);
   [m, n] = size(A);
endfunction 