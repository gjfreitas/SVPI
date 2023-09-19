%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       28/03/2023

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
  'Ex8'
  'Ex9'
  'Ex10'
  'Ex11'
  'Ex12'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------
exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  
  img = im2double(imread('Manycoins.png'));

  A = imbinarize(img, 0.18);

  figure()
  subplot(2,3,1)
  imshow(A), title('A')

  X=bwmorph(A,'erode',3);
  Y=bwmorph(A,'dilate',3);

  subplot(2,3,2)
  imshow(X), title('X')

  subplot(2,3,3)
  imshow(Y), title('Y')

  A_from_X = bwmorph(X, 'dilate', 3);
  A_from_Y = bwmorph(Y, 'erode', 3);

  subplot(2,3,4)
  imshow(A_from_X),title('A from X')

  subplot(2,3,5)
  imshow(A_from_Y),title('A from Y')
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

  A = imread("Manycoins.png");
  B = imbinarize(A,0.18); BW = B;

  tot = sum(sum(B));
  part = tot;
  n = 0;

  preservar = tot/3; % tot/2

  % Executa um loop 'while' que continua até que o número de pixels brancos
  % seja menor ou igual a metade do número total de pixels brancos originais.
  while(part>preservar)
      BW = bwmorph(BW,'erode');
      part = sum(sum(BW)); % número de pixeis brancos na imagem erodida
      n = n+1;
  end

  subplot(1,3,1), imshow(B)
  title(sprintf('Original image \n %d pixels',tot))

  subplot(1,3,2), imshow(BW)
  title(sprintf('Eroded %d times \n %d pixels',n, nnz(BW))) % imagem erodida n vezes

  BW = bwmorph(B,'erode',n-1); % imagem erodida n-1 vezes
  subplot(1,3,3), imshow(BW)
  title(sprintf('Eroded %d times \n %d pixels',n-1, nnz(BW)))

end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

  A = imread("Manycoins.png");
  B = imbinarize(A,0.18);

  tot = sum(sum(B));
  subplot(1,3,1), imshow(B); title('Manycois.png a 18%');
  str = sprintf('Total pixels: %d', tot); xlabel(str);

  BW = bwmorph(B,'close');
  comC = sum(sum(and(BW,B)));
  subplot(1,3,2), imshow(BW); title('close');
  str = sprintf('Tem %d pixels comuns', comC); xlabel(str);

  BW = bwmorph(B,'open');
  com0 = sum(sum(and(BW,B)));
  subplot(1,3,3), imshow(BW); title('open');
  str = sprintf('Tem %d pixels comuns', com0); xlabel(str);

end

%% Ex4 -------------------------------------------------------------------
exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

  figure('units','normalized','outerposition',[0 0 1 1])

  A = zeros(300, 300);
  A(10:20:end, 10:20:end) = 1;
  subplot(1,2,1)
  imshow(A)

  SE1 = strel('line', 10, 0);

  B = imdilate(A, SE1);
  
  subplot(1,2,2)
  imshow(B)

end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    A = rand(300, 300) > 0.9995;
    
    subplot(1,2,1)
    imshow(A)

    SE = strel('diamond', 8);
    B = imdilate(A, SE);

    subplot(1,2,2)
    imshow(B)
end

%% Ex6 --------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    Z = im2double(imread("pcb2.png"));
    subplot(1,2,1)
    imshow(Z)

    Z = rgb2gray(Z);
    bin = bwmorph(Z,'skel',Inf);
    subplot(1,2,2)
    imshow(bin)

    SE_CROSS = ones(3);
    SE_CROSS([1 end],[1 end]) = -1;
    BW2 = bwhitmiss(bin,SE_CROSS);
    BW3 = zeros(4,size(Z,1),size(Z,2));
    for i=1:4
        SE_T = ones(3);
        SE_T(2:end,[1 end]) = -1;
        SE_T = rot90(SE_T,i);
        BW3(i,:,:) = bwhitmiss(bin,SE_T);
    end
    hold on
    for i=1:size(Z,1)
        for j=1:size(Z,2)
          if BW2(i,j)
              plot(j,i,'g*')
          end
          if any(BW3(:,i,j)==1)
              plot(j,i,'r*')
          end
        end
    end
    

  % Pode haver casos em que os cruzamentos não são detectados. 
  % Isto pode acontecer se o tamanho das linhas nas máscaras não coincidir 
  % com o tamanho das linhas no esqueleto da imagem ou se houver ruído na 
  % imagem que confunda a detecção dos cruzamentos. 
  % Nesses casos, é necessário ajustar os parâmetros ou aplicar técnicas 
  % de pré-processamento de imagem para melhorar a detecção.


end

%% Ex7 --------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  
  A = imread('pcb.png');
  A = im2bw(A, 0.5);

  figure()
  subplot(2,2,1)
  hold on
  imshow(A)
  title('A')
    
  B = bwmorph(A,'shrink', inf);
  subplot(2,2,2)
  imshow(B)
  title('Esqueleto')

  F = [-1 -1 -1; -1 8 -1; -1 -1 -1];
  X = filter2(F,B) == 8;
   
  [ys,xs] = find(X);
  subplot(2,2,1)
  plot(xs,ys,'+r')

  SE = strel('disk',8);
  X_dil = imdilate(X,SE);
  subplot(2,2,3)
  imshow(B)
  title('Diltated')


  Xholes = and(A, X_dil);
  subplot(2,2,4)
  imshow(Xholes)
  title('Objetivo')




end

%% Ex8 (Opcional) ---------------------------------------------------------
exercise = 'Ex8'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ': Opcional (Não feito)'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...

end

%% Ex9 --------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  
      Z = im2double(imread("pcb_holes.png"));
      Z = rgb2gray(Z);
      subplot(1,3,1)
      imshow(Z)
      title('Original')
    
      bin = bwmorph(1-Z,'shrink',inf);
      subplot(1,3,2)
      imshow(bin)
      title('Esqueleto')
      ppi = filter2([1 1 1; 1 -8 1; 1 1 1], bin);
    
      furos = sum(sum(ppi==-8));
      
      subplot(1,3,3)
      imshow(Z)
      hold on
      for i=1:size(Z,1)
          for j=1:size(Z,2)
              if ppi(i,j) == -8
                  plot(j,i,'r*')
              end
          end
       end
       title(['Number of holes: ' num2str(furos)]);


end

%% Ex10 --------------------------------------------------------------------
exercise = 'Ex10'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    A = im2double(imread('anilhas.png'));
    subplot(1,3,1)
    imshow(A)
    title('Original')

    BW = imbinarize(A); 
    BW = ~BW;
    subplot(1,3,2)
    imshow(BW)
    title('Binarizada')
    filled_BW = imfill(BW, 'holes');
    
    subplot(1,3,3)
    imshow(filled_BW)
    title('Sem Buracos')


end

%% Ex11 --------------------------------------------------------------------
exercise = 'Ex11'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  

    % Ler a imagem
    img = im2double(imread('anilhas.png'));
    % Mostrar
    figure(1)
    subplot(1, 4, 1)
    hold on
    imshow(img)
    title('Imagem Original')

    img_binaria = imbinarize(img);
    img_binaria_inv = ~img_binaria;

    subplot(1, 4, 2)
    imshow(img_binaria_inv)
    title('Imagem Binarizada Invertida')

    % Aplicar o skrink à imagem para obter os pontos das anilhas
    erosao_pontos = bwmorph(img_binaria_inv, 'shrink', Inf);

    subplot(1, 4, 3)
    imshow(erosao_pontos)
    title('Imagem Shirinked')

    % Aplciar um filtro para pixeis isolados
    Filtro = [-1 -1 -1
              -1  8 -1
              -1 -1 -1];
    img_filtrada = abs(filter2(Filtro, erosao_pontos));

    % Definir a imagem para a mascara
    img_pontos = zeros(size(img, 1), size(img, 2));
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if(img_filtrada(i, j) == 8)
                img_pontos(i, j) = 1;
                subplot(1, 4, 1)
                plot(j, i, '+r')
            end
        end
    end
    
    subplot(1, 4, 4)
    imshow(img_pontos)
    title('Mascara dos Pontos')

    % Aplciar o recontruct
    restantes_objetos = imreconstruct(logical(img_pontos), img_binaria_inv);
    
    figure()
    subplot(1, 2, 1)
    imshow(restantes_objetos)
    title('Restantes Objetos')

    anilhas_reconstruidas = img_binaria_inv - restantes_objetos;
    subplot(1, 2, 2)
    imshow(anilhas_reconstruidas)
    title('Só Anilhas')


end


%% Ex12 (Opcional) --------------------------------------------------------
exercise = 'Ex12'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ': Opcional (Não feito)'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...

end