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
  'Ex8'
  'Ex9'
  }; %Defines the exercise to be executed (one or more at a time).



%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    % add your code here ...
    close all

    matches1 = im2double(imread('matches1.png'));
    matches2 = im2double(imread('matches2.png'));

    figure(1)
    subplot(2,2,1)
    imshow(matches1)
    subplot(2,2,2)
    imhist(matches1)
    subplot(2,2,3)
    imshow(matches2)
    subplot(2,2,4)
    imhist(matches2)

    figure(2)
    
    matches1(matches1 < 0.2) = 1;
    subplot(2,2,1)
    imshow(matches1)
    
    subplot(2,2,2)
    imhist(matches1)
    
    matches2(matches2 < 0.2) = 1;
    subplot(2,2,3)
    imshow(matches2)

    subplot(2,2,4)
    imhist(matches2)


    % O efeito não resulta tão bem na imagem %matches2 . Porquê?
    % Porque a separação não é tão acentuada e neste caso não são apenas os
    % pixeis da cabeça com <0.2 cor
  
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
    close all

    matches1 = im2double(imread('matches1.png'));
    matches = matches1;

    figure(1)
    subplot(5,2,1)
    imshow(matches1)
    title('Imagem Original')

    subplot(5,2,2)
    imhist(matches1)
    
    % Ponto 1 - Colocar cabeça a branco
    subplot(5,2,3)
    matches1(matches1 < 0.2) = 1;
    imshow(matches1)
    title('Imagem com cabeça a branco')

    subplot(5,2,4)
    imhist(matches1)
    
    % Ponto 2 - Expansão
    subplot(5,2,5)
    matches_new = imadjust(matches1);
    imshow(matches_new)
    title('Expansão')

    subplot(5,2,6)
    imhist(matches_new)
    
    % Ponto 3 - máscara (Otsu)
    mask = graythresh(matches_new);
    Bw = imbinarize(matches1,mask);
    
   
    subplot(5,2,7)
    imshow(Bw)
    title('Imagem após Otsu')

    subplot(5,2,8)
    imhist(Bw)

    % Ponto 4 - usar a negação para forçar o fundo a cinzento
    subplot(5,2,9)
    
    neg = 1-Bw;
    matches(neg==1)=0.5;
    imshow(matches)
    title('Imagem Final')

    subplot(5,2,10)
    imhist(matches1)

    figure(2)
    matches1 = im2double(imread('matches1.png'));
    subplot(1,2,1)
    imshow(matches1)
    title('Imagem Original')
    subplot(1,2,2)
    imshow(matches)
    title('Imagem pretendida')

    figure(3)
    subplot(2,2,1)
    imshow(matches_new)
    title('Expansão')

    subplot(2,2,2)
    imhist(matches_new)
    title('Histograma Expansão')

    subplot(2,2,3)
    imshow(Bw)
    title('Imagem após Otsu')

    subplot(2,2,4)
    imshow(matches)
    title('Imagem pretendida')


end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
    close all
    img = im2double(imread('trimodalchess.png'));

    %figure('units','normalized','outerposition',[0 0 1 1])
    figure(1)
    subplot(1,2,1)
    imshow(img)

    subplot(1,2,2)
    imhist(img)
    hold on
    
    [thresholds, ~] = multithresh(img, 2);

    % mostrar as linhas no histograma
    xline(thresholds(1),'r-')
    xline(thresholds(2),'r-')

   

    figure(2)
    subplot(2,3,1)
    mask1 = img < thresholds(1);  % pretos
    mask2 = img > thresholds(2); % brancos
    mask_pb = mask1+mask2; % pretos & brancos
    imshow(mask_pb)
    title('Pretos e brancos')

    subplot(2,3,2)
    mask1 = img < thresholds(1); % pretos
    mask2 = img > thresholds(2); % brancos
    mask_c = 1-(mask2+mask1); % cinzentos
    imshow(mask_c)
    title('Cinzentos')

    subplot(2,3,3)
    mask_p = img < thresholds(1); % pretos
    imshow(mask_p)
    title('Pretos')


    subplot(2,3,4)
    mask_b = img > thresholds(2); % brancos
    imshow(mask_b)
    title('Brancos')

    subplot(2,3,5)
    mask_pc = img < thresholds(2); % pretos e cinzentos
    imshow(mask_pc)
    title('Pretos e cinzentos')

    subplot(2,3,6)
    mask_bc = img > thresholds(1); % brancos e cinzentos
    imshow(mask_bc)
    title('Brancos e cinzentos')
  
end


%% Ex4 -------------------------------------------------------------------
exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    
    figure(1)
    
    seeds = im2double(imread('seeds.png'));
    
    subplot(2,2,1)
    imshow(seeds)
    title('seeds.png')

    seed_auto = autobin(seeds);

    subplot(2,2,2)
    imshow(seed_auto)
    title('Resultado')


    seeds_inv = im2double(imread('seeds_inv.png'));
    
    subplot(2,2,3)
    imshow(seeds_inv)
    title('seeds\_inv.png')

    seeds_inv_auto = autobin(seeds_inv);

    subplot(2,2,4)
    imshow(seeds_inv_auto)
    title('Resultado')

    % Esta função autobin() funcionará sempre bem? Quando falha?
    % R: Não funcionará bem em todos os casos.
    % A função pode falhar em alguns casos em que a imagem tem iluminação 
    % ou contraste irregular ou a distribuição de intensidades dos pixels 
    % não é adequada para binarização por Otsu.

    % Um exemplo de caso em que a função pode falhar é em imagens com 
    % objetos que possuem tons de cinza semelhantes ao fundo.


end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all

    img = im2double(imread('rice.png'));
    
    size1 = size(img,1);
    size2 = size(img,2);

    l = size1/2;
    r = size2/2;

    %figure('units','normalized','outerposition',[0 0 1 1])
    figure()

    % 4 regiões
    clear rr
    clear ll

    for i=1:r
        rr(i) = r;
        ll(i) = l;
    end
    subplot(1,3,1)
    imshow(img)
    line('XData',1:l,'YData',rr,'Color','r','LineWidth',2)
    line('XData',ll,'YData',1:r,'Color','r','LineWidth',2)
    ll(i+1) = l;
    rr(i+1) = r;
    line('XData',ll,'YData',r:size2,'Color','r','LineWidth',2)
    line('XData',l:size1,'YData',rr,'Color','r','LineWidth',2)
    title('4 regiões')

    % Justaposição das 4 regiões binarizadas separadamente (4 histogramas)
    subplot(1,3,2)
    img1 = img(1:l,1:r); img2 = img(1:l,r:end); img3 = img(l:end,1:r); img4 = img(l:end,r:end);
    
    
    mask1 = graythresh(img1);
    Bw1 = imbinarize(img1,mask1);

    mask2 = graythresh(img2);
    Bw2 = imbinarize(img2,mask2);

    mask3 = graythresh(img3);
    Bw3 = imbinarize(img3,mask3);

    mask4 = graythresh(img4);
    Bw4 = imbinarize(img4,mask4);

    img_new = zeros(size1,size2);
    img_new(1:l,1:r) = Bw1;
    img_new(1:l,r:end) = Bw2;
    img_new(l:end,1:r) = Bw3;
    img_new(l:end,r:end) = Bw4;

    imshow(img_new)
    title('Binarização separadamente')



    % Binarização da imagem global (usando Otsu e um histograma único)
    subplot(1,3,3)
    mask = graythresh(img);
    Bw = imbinarize(img,mask);
    imshow(Bw)
    title('Binarização da imagem global')

    % SLIDE 2 - EX5
    img = im2double(imread('rice.png'));
    size1 = size(img,1);
    size2 = size(img,2);

    l = size1/2;
    r = size2/2;


    img1 = img(1:l,1:r); img2 = img(1:l,r:end); img3 = img(l:end,1:r); img4 = img(l:end,r:end);
    
    
    mask1 = graythresh(img1); mask2 = graythresh(img2); mask3 = graythresh(img3); mask4 = graythresh(img4);
    Bw1 = imbinarize(img1,mask1); Bw2 = imbinarize(img2,mask2); Bw3 = imbinarize(img3,mask3); Bw4 = imbinarize(img4,mask4);

    img_new = zeros(size1,size2);
    img_new(1:l,1:r) = Bw1; img_new(1:l,r:end) = Bw2; img_new(l:end,1:r) = Bw3; img_new(l:end,r:end) = Bw4;

    mask = graythresh(img);
    Bw = imbinarize(img,mask);

    %figure('units','normalized','outerposition',[0 0 1 1])
    figure()
    subplot(2,2,1)
    imshow(Bw)
    title('Limiar global')
    subplot(2,2,2)
    imshow(img_new)
    title('Multi-histograma')
    
    % Comparar os resultados do exercício anterior ilustrando os pixels
    % diferentes nas imagens que resultam dos dois processos.

    subplot(2,2,3)
    diff_img = xor(Bw,img_new);
    imshow(diff_img)
    title('Diferenças')
    
    % Proceder a uma operação de  limpeza  da imagem resultante de múltiplos histogramas
    % para eliminar alguns pixels menos relevantes.

    subplot(2,2,4)
    D = medfilt2(img_new, [3, 3]); % aula 4
    imshow(D)
    title('Multi-hist + mediana')


end


%% Ex6 (Opcional) -------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
    
  % add your code here ...
    close all
    img = im2double(imread('rice.png'));
    N = 5; M = 3;
    Bw = MultiRegionBin(img,N,M);

    N = 25; M = 25;
    Bw2 = MultiRegionBin(img,N,M);

end

%% Ex7 (Opcional) -------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

  close all
  
    rice = im2double(imread('rice.png'));

    figure(1)
    subplot(1,3,1)
    imshow(rice)
    title('A')

    roi = circularROI(100, 50, 80, 120, rice);
    subplot(1,3,2)
    imshow(roi)
    title('M')

    B = autobinwithmask(rice, roi);
    
    % NÃO DA O PLOT BEM
    subplot(1,3,3)
    imshow(rice);
    hold on
    imshow(B)
    title('B')


end

%% Ex8 -------------------------------------------------------------------
exercise = 'Ex8'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

  % add your code here ...
    close all

    figure(1)

    A = imread('rice.png');

    subplot(1,4,1)
    imshow(A)
    title('Original')

    subplot(1,4,2)
    B = imbinarize(A, adaptthresh(A));
    imshow(B)
    title('Adaptive Binarization')
    Y = B;
    
    % Como se poderia "limpar" a imagem resultante para ficarem apenas os
    % objetos de grãos de arroz como ilustrado à direita?
    % R: Usando bwareaopen(): Esta função remove objetos binários menores que um determinado tamanho (como no proximo exercicio).
    % ou então um filtro da mediana

    subplot(1,4,3)
    B = bwareaopen(B, 50);
    imshow(B)
    title('Cleaned Image - bwareaopen(50)')
    
    subplot(1,4,4)
    imshow(medfilt2(Y,[3,3]))
    title('Cleaned Image - mediana')

  
end

%% Ex9 -------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

  % add your code here ...
    close all

    % Passo 1:
    subplot(1,2,1)
    img = im2double(imread('samples2.png'));
    imshow(img)
    
    % Passo 2:
    sensibilidade = 0.65; % ajustar
    limiares = adaptthresh(img, sensibilidade);
    
    % Passo 3:
    img_bin = 1-imbinarize(img, limiares);
    
    % Passo 4:
    img_bin_sem_pequenos = bwareaopen(img_bin, 100);
    
    subplot(1,2,2)
    imshow(img_bin)
  
end
