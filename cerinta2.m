function cerinta2()
    input_files = ['image1'; 'image2'; 'image3'; 'image4'];
  for i = 1:2; %se seteaza dupa preferinte
    name = input_files(i, 1:6);
    image_in = strcat('in/images/', strcat(name, '.gif'));
    [vals, m, n, A] = valorisingulare(image_in);
    k = [1:19 20:20:99 100:30:min(m,n)];

    %prima cerinta
    figure
    subplot(2, 2, 1)
    plot(vals, 'o', 'linewidth', 3);  
    title("Cerinta2, 1)");
    
    %a doua cerinta 
    for i = k
      vals2(i) = sum(vals(1:i))/sum(vals(1:min(m,n)));
    endfor
    subplot(2, 2, 2)
    plot(k(:), (vals2(k(:))), 'o', 'linewidth', 3);
    title("Cerinta2, 2)");

    %a treia cerinta
    suma = 0;
    err=ones(1);
    for iter = 1:length(k)
          A_k = cerinta1(image_in, k(iter));
      suma = 0;
      for i = 1: m
        for j = 1: n
          suma = suma + ((A(i,j)-A_k(i,j))^2);
        endfor
      endfor
      err(iter) = suma/(m*n);
    endfor
    subplot(2, 2, 3)
    plot(k(:), err(:), 'o', 'linewidth', 3);
    title("Cerinta2, 3)");
    
    %a patra cerinta
    compresie = ones(1);
    for i = 1:length(k)
      compresie(i) = (m*k(i) + n*k(i) + k(i))/(m*n);
    endfor
    subplot(2, 2, 4)
    plot(k(:), compresie(:), 'o', 'linewidth', 3);
    title("Cerinta2, 4)");
  endfor    
 endfunction