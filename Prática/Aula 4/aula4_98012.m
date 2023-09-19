%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       2023

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
  'Ex1'
  'Ex2'
  'Ex3'
  'Ex4'
  'Ex5'
  'Ex6'
  'Ex7'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    % add your code here ...
    close all

    % Cria o fundo preto
    dim = 200;
    Z = zeros(dim,dim);
    
    centro = dim/2;
    
    ret1 = 50;
    ret2 = 80;
    c1 = ret1/2;
    c2 = ret2/2;
    
    % Cria o retângulo
    Z(centro-c1:centro+c1,centro-c2:centro+c2) = 1;
    
    % representar
    figure(1)
    subplot(1,4,1)
    imshow(Z)
    title('Imagem')
    
    % Adicionar ruído "salt & pepper" à imagem com densidade de 5%
    B = imnoise(Z, 'salt & pepper',5/100);
    
    % representar
    subplot(1,4,2)
    imshow(B)
    title('Imagem + Ruído')
    
    % Filtrar usando a média
    f = ones(3,3)/9;
    C=filter2(f,B);
    
    % representar
    subplot(1,4,3)
    imshow(C)
    title('Ruído Filtrado Média')
    
    % Filtrar usando a média
    D = medfilt2(B, [3, 3]);
    
    % representar
    subplot(1,4,4)
    imshow(D)
    title('Ruído Filtrado Mediana')
  
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    % add your code here ...
    close all
    
    dim = 200;
    Z = zeros(dim,dim);
    
    centro = dim/2;
    
    ret1 = 50;
    ret2 = 80;
    c1 = ret1/2;
    c2 = ret2/2;
    
    % Cria o retângulo
    Z(centro-c1:centro+c1,centro-c2:centro+c2) = 1;
    
    % representar
    figure(2)
    subplot(1,3,1)
    imshow(Z)
    title('Imagem')
    
    % Adicionar ruído "salt & pepper" à imagem com densidade de 1%
    B = imnoise(Z, 'salt & pepper',1/100);
    
    % representar
    subplot(1,3,2)
    imshow(B)
    title('Imagem + Ruído')
    
    % Filtro Isolado
    rng(0) %fixar seed para os resultados serem sempre iguais
    f = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    
    % Aplicar filtro de pontos isolados usando a função filter2
    C = abs(filter2(f, B));
    %C = filter2(f, B);
    
    counts = sum(C(:)==8);
    
    
    % representar
    subplot(1,3,3)
    imshow(C==8)
    title(['Filtro Isolado : ',num2str(counts),' pontos isolados'])

  
end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all

    rng(0)
    
    
    dim = 200;
    Z = zeros(dim,dim);
    
    centro = dim/2;
    
    ret1 = 50;
    ret2 = 80;
    c1 = ret1/2;
    c2 = ret2/2;
    
    % Cria o retângulo
    Z(centro-c1:centro+c1,centro-c2:centro+c2) = 1;
    
    % representar
    figure(1)
    subplot(1,2,1)
    imshow(Z)
    title('Imagem')
    
    % Adicionar ruído "salt & pepper" à imagem com densidade de 0.5%
    T = imnoise(Z, 'salt & pepper',0.5/100);
    subplot(1,2,2)
    imshow(T)
    title('Imagem + Ruído')
    
    F1 = [1 1 1; 1 -8 1; 1 1 1];
    
    F2 = [1 2 1; 2 -12 2; 1 2 1];
    
    F3 = [-1 1 -1; 1 4 1; -1 1 -1];
    
    F4 = [1 2 3; 4 -100 5; 6 7 8];
    
    F = zeros(3,3,4);
    F(:,:,1) = F1;
    F(:,:,2) = F2;
    F(:,:,3) = F3;
    F(:,:,4) = F4;

    W = [F1(2,2) F2(2,2) F3(2,2) F4(2,2)]; %[-8, 12, 4, -100]
    NW = [sum(F1(:))-W(1) sum(F2(:))-W(2) sum(F3(:))-W(3) sum(F4(:))-W(4)]; %[8, 12, 0, -36]

    figure(2)
    for n = 1:4
        X = filter2(F(:,:,n),T);
        ZW = (X == W(n));
        ZB = (X == NW(n));

        subplot(2,4,n), imshow(ZW)
        str = sprintf('Total %d, F(%d)', nnz(ZW), n); xlabel(str);

        subplot(2,4,4+n), imshow(ZB)
        str = sprintf('Total %d, F(%d)', nnz(ZB), n); xlabel(str);
    end
  
end

%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  A=[
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
    0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
    0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
    0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
    0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
    0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
    0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
    0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
    0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
    0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
    0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
    0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
    0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
    0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
    0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
    0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
    0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
    0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
    0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];
    
    figure('units','normalized','outerposition',[0 0 1 1])
    subplot(1,4,1)
    imshow(A)
    vs_imgrid(A)
    title('A')

    filtro = [0 -1 0; 
              -1 4 -1; 
              0 -1 0];

    X = filter2(filtro,A);
    
    B = zeros(size(A,1), size(A,2));
    idx = 1;
    for i=1:size(A,1)
        for j = 1:size(A,2)
            if X(i,j) == 1
                B(i,j) = 1;
                S(idx,1) = i;
                S(idx,2) = j;
                idx = idx+1;
            end
        end
    end
    subplot(1,4,2)
    imshow(B)
    vs_imgrid(B)
    title('B')

    % ou então representar assim
    imshow(X == 1)
    vs_imgrid(X == 1)

    subplot(1,4,3)
    imshow(A)
    vs_imgrid(A)
    title('Ponto relevantes em A')
    hold on
    plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1);                        
    
    A(X(:) == 1) = 0;
    subplot(1,4,4)
    imshow(A)
    vs_imgrid(A)
    title('Eliminated')
    hold on    
    plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1);
end

%% Ex5 (Opcional) -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  rng(0)
  close all
  A=[
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
    0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
    0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
    0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
    0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
    0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
    0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
    0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
    0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
    0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
    0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
    0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
    0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
    0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
    0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
    0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
    0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
    0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
    0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];
    
  nint = 'start';
  while nint > 0
        clear S
        clear z
        clear X
    
        filtro = [0 -1 0; 
                  -1 4 -1; 
                  0 -1 0];
    
        marks = filter2(filtro,A);
        
        B = zeros(size(A,1), size(A,2));
        idx = 1;
        for i=1:size(A,1)
            for j = 1:size(A,2)
                if marks(i,j) == 1
                    B(i,j) = 1;
                    S(idx,1) = i;
                    S(idx,2) = j;
                    idx = idx+1;
                end
            end
        end
        if exist('S','var') == 0
            break
        end
   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % Gerar uma imagem aleatória X com cerca de 2.5% de pixels pretos
        X = rand([size(A,1), size(A,2)]); 
        X(X(:) < 0.025) = 0;    % probabilidade de um pixel ser preto é de 0.025
        X(X(:) ~= 0) = 1;       % todos os outros são 1
    
        c = sum(A(X(:) == 0));
        
        idx = 1;
        for i=1:size(A,1)
            for j = 1:size(A,2)
                if X(i,j) == 0
                    B(i,j) = 1;
                    z(idx,1) = i;
                    z(idx,2) = j;
                    idx = idx+1;
                end
            end
        end
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        figure(2)
        subplot(1,4,1)
        hold on
        imshow(A)    
        plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1); 
        title(['Orig nint=',num2str(size(S,1))])
        nint = size(S,1);
        disp(nint);
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        subplot(1,4,2)
        title('To eliminate')
        imshow(X)
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        subplot(1,4,3)
        title(['Acc nint=',num2str(c)])
        hold on
        imshow(A)    
        plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1); 
    
        plot(z(:,2),z(:,1), 'ro', 'MarkerSize', 5, 'LineWidth', 1); 
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        A(X(:) == 0) = 0;
        subplot(1,4,4)
        imshow(A)
        title('Eliminated')
        hold on    
        plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1); 
        plot(z(:,2),z(:,1), 'ro', 'MarkerSize', 5, 'LineWidth', 1); 
  end

    %close(2)
    figure(3)
    imshow(A)
    title('after cleanup')

end

%% Ex6 -------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  rng(0)
  close all
  A=[
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
    0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
    0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
    0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
    0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
    0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
    0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
    0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
    0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
    0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
    0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
    0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
    0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
    0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
    0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
    0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
    0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
    0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
    0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];


  % Será possível definir um mesmo filtro que possa ser usado para os exercícios 4 e 6?
  % R: Sim, mas é preciso ter em atenção qual o valor para o filtro se
  % considera de interesse (no ex 4 filtro==1, aqui filtro==3)

  % Também é preciso ter em atenção em não eliminar o inicio e o fim do labirinto
  % Para isso, vamos ignorar a primeira e última linha e coluna da matriz A
  % for i vai de 2 até 20 para evitar 'limpar' o inicio do labirinto (no caso sem rotação)
  % for j vai de 2 até 20 para evitar 'limpar' o fim do labirinto (no caso sem rotação)
  filtro = [0 -1 0; 
            -1 4 -1; 
            0 -1 0];
    

    %figure(1)
    figure('units','normalized','outerposition',[0 0 1 1])
    subplot(1,4,1)
    imshow(A)
    vs_imgrid(A)
    title('A')
    
    X = filter2(filtro,A);
    
    B = zeros(size(A,1), size(A,2));
    idx = 1;
    for i=2:size(A,1)-1
        for j = 2:size(A,2)-1
            if X(i,j) == 3
                B(i,j) = 1;
                S(idx,1) = i;
                S(idx,2) = j;
                idx = idx+1;
            end
        end
    end
    
    subplot(1,4,2)
    imshow(B)
    vs_imgrid(B)
    title('B')
    
    subplot(1,4,3)
    imshow(A)
    vs_imgrid(A)
    title('Becos sem saída')
    hold on
    plot(S(:,2),S(:,1), 'r*', 'MarkerSize', 5, 'LineWidth', 1);  
    
    subplot(1,4,4)
    A(B(:) == 1) = 0;
    imshow(A)
    vs_imgrid(A)
    title('Labirinto sem becos sem saída')
    hold on
    plot(S(:,2),S(:,1), 'r*', 'MarkerSize', 5, 'LineWidth', 0.4); 


end

%% Ex7 (Opcional) -------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  rng(0)
  close all

  for image_idx=1:2:8
      A=[
        0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 0
        0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 0 1 0 1 1 1 0 1 0 1 0 1 1 1 1 1 0
        0 0 0 0 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0
        0 1 0 1 0 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 1 0 0 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
        0 1 0 0 0 0 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 0
        0 1 0 0 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0
        0 1 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 1 0 1 0
        0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 1 0
        0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 1 0 1 0
        0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0
        0 1 0 1 1 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 0
        0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 1 0
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        ];
      
      % Rotações da matriz A
      if image_idx == 1
        A =rot90(A,1-1);
      elseif image_idx == 3
        A =rot90(A,2-1);
      elseif image_idx == 5
        A =rot90(A,3-1);
      elseif image_idx == 7
        A =rot90(A,4-1);
      end

      A_dirty = A;
    
    % Será possível definir um mesmo filtro que possa ser usado para os exercícios 4 e 6?
    % R: Sim, mas é preciso ter em atenção qual o valor para o filtro se
    % considera de interesse (no ex 4 filtro==1, aqui filtro==3)
    
    % Também é preciso ter em atenção em não eliminar o inicio e o fim do labirinto
    % Para isso, vamos ignorar a primeira e última linha e coluna da matriz A
    % for i vai de 2 até 20 para evitar 'limpar' o inicio do labirinto (no caso sem rotação)
    % for j vai de 2 até 20 para evitar 'limpar' o fim do labirinto (no caso sem rotação)
      filtro = [0 -1 0; 
              -1 4 -1; 
              0 -1 0];
        
      nnint = 'start';
      while nnint > 0
            clear S
    
            figure(image_idx)
            subplot(1,4,1)
            imshow(A)
            title('A')
        
            X = filter2(filtro,A);
            
            B = zeros(size(A,1), size(A,2));
            idx = 1;
            for i=2:size(A,1)-1
                for j = 2:size(A,2)-1
                    if X(i,j) == 3
                        B(i,j) = 1;
                        S(idx,1) = i;
                        S(idx,2) = j;
                        idx = idx+1;
                    end
                end
            end
    
            if exist('S','var') == 0
                break
            end
            subplot(1,4,2)
            imshow(B)
            title('B')
        
            subplot(1,4,3)
            imshow(A)
            title('Becos sem saída')
            hold on
            plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1);  
            nint = size(S,1);
            disp(nint);
        
            subplot(1,4,4)
            A(B(:) == 1) = 0;
            imshow(A)
            title('Labirinto sem becos sem saída')
            hold on
            plot(S(:,2),S(:,1), 'b+', 'MarkerSize', 5, 'LineWidth', 1); 
        end 
        
        figure(image_idx+1)
        subplot(1,2,1)
        imshow(A_dirty)
        title('Original Image')
        subplot(1,2,2)
        imshow(A)
        title('Cleaned')
  end

  close(1,3,5,7)
  
end
