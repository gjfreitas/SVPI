%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       16/05/2023

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
  'Ex1a'
  'Ex1b'
  'Ex2'
  'Ex3'
  'Ex4'
  'Ex5'
  'Ex6'
  'Ex7'
  'Ex8'
  'Ex9'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1a -------------------------------------------------------------------

exercise = 'Ex1a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    img = imread('artemoderna2.png');


    figure(1)
    subplot(2,4,1)
    imshow(img)
    
    % Máscara para vermelhos puros (R=100%, G=0, B=0)
    mascara_vermelho = zeros(size(img, 1), size(img, 2));
    mascara_vermelho(img(:,:,1) == 255 & img(:,:,2) == 0 & img(:,:,3) == 0) = 1;
    subplot(2,4,2)
    imshow(mascara_vermelho)
    
    
    % Máscara para verdes puros (R=0, G=100%, B=0)
    mascara_verde = zeros(size(img, 1), size(img, 2));
    mascara_verde(img(:,:,1) == 0 & img(:,:,2) == 255 & img(:,:,3) == 0) = 1;
    subplot(2,4,3)
    imshow(mascara_verde)
    
    
    % Máscara para azuis puros (R=0, G=0, B=100%)
    mascara_azul = zeros(size(img, 1), size(img, 2));
    mascara_azul(img(:,:,1) == 0 & img(:,:,2) == 0 & img(:,:,3) == 255) = 1;
    subplot(2,4,4)
    imshow(mascara_azul)
    
    
    imagem_resultante_vermelhos = img;
    imagem_resultante_verdes = img;
    imagem_resultante_azuis = img;
    
    % Ajustar áreas fora da máscara de vermelho puro para preto
    imagem_resultante_vermelhos(repmat(mascara_vermelho, [1, 1, 3]) == 0) = 0;
    
    % Ajustar áreas fora da máscara de verde puro para preto
    imagem_resultante_verdes(repmat(mascara_verde, [1, 1, 3]) == 0) = 0;
    
    % Ajustar áreas fora da máscara de azul puro para preto
    imagem_resultante_azuis(repmat(mascara_azul, [1, 1, 3]) == 0) = 0;
    
    
    subplot(2,4,6)
    imshow(imagem_resultante_vermelhos)
    subplot(2,4,7)
    imshow(imagem_resultante_verdes)
    subplot(2,4,8)
    imshow(imagem_resultante_azuis)
  
  
end

%% Ex1b -------------------------------------------------------------------
exercise = 'Ex1b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
    close all
    img = im2double(imread('artemoderna2.png'));
    figure(2)
    subplot(1,3,1)
    imshow(img)
    
    mascara_amarela = zeros(size(img, 1), size(img, 2));
    mascara_amarela(img(:,:,1) > 0.8 & img(:,:,2) > 0.6 & img(:,:,3) < 0.2) = 1;
    
    subplot(1,3,2)
    imshow(mascara_amarela)
    
    imagem_resultante = img;
    imagem_resultante(repmat(~mascara_amarela, [1, 1, 3])) = 1;
    subplot(1,3,3)
    imshow(imagem_resultante)
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

  % add your code here ...  
    close all
    A = imread('mongolia.jpg');

    [cR,cG,cB,x]=rgbhist(A);
    
    figure(1)
    subplot(2,1,1)
    imshow(A)
    subplot(2,1,2)
    hold on
    plot(x, cR, 'r-')
    plot(x, cG, 'g-')
    plot(x, cB, 'b-')
    xlim([0 1]); ylim([0 2500])
  
end

%% Ex3 -------------------------------------------------------------------

exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    A = im2double(imread('morangos.jpg'));

    [cR,cG,cB,x]=rgbhist(A);
    
    figure(1)
    subplot(2,1,1)
    imshow(A)
    subplot(2,1,2)
    hold on
    plot(x, cR, 'r-')
    plot(x, cG, 'g-')
    plot(x, cB, 'b-')
    xlim([0 1]); ylim([0 5000])
    
    figure()
    points = (A(:,:,1) > 0.19) & (A(:,:,2) < 0.1) & (A(:,:,3) < 0.1);
    red_only = A;
    red_only(repmat(~points,[1 1 3])) = 0;
    imshow(red_only)
    title('Morangos')
    
    figure()
    
    points = (A(:,:,1) < 0.19) & (A(:,:,2) > 0.1) & (A(:,:,3) < 0.1);
    green_only = A;
    green_only(repmat(~points,[1 1 3])) = 0;
    imshow(green_only)
    title('Folhas')

end

%% Ex4 -------------------------------------------------------------------
exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all

    A = imread('ArteModerna1.jpg');
    imagem_hsv = rgb2hsv(A);
    
    % Obter os canais H, S e V
    H = imagem_hsv(:, :, 1);
    S = imagem_hsv(:, :, 2);
    V = imagem_hsv(:, :, 3);
    
    limiar_h_min = 0.15; % Limiar mínimo para H
    limiar_h_max = 0.2;  % Limiar máximo para H
    
    
    % Criar a máscara para isolar o amarelo
    mascara_amarelo = (H >= limiar_h_min) & (H <= limiar_h_max);
    
    % Aplicar a máscara para isolar o amarelo na imagem
    imagem_amarela = A;
    imagem_amarela(repmat(~mascara_amarelo, [1, 1, 3])) = 0;
    
    
    figure()
    subplot(1, 4, 1);
    imshow(A);
    title('Imagem Original');
    subplot(1, 4, 2);
    imshow(mascara_amarelo);
    title('Máscara');
    subplot(1, 4, 3);
    imshow(imagem_amarela);
    title('Amarelo Isolado');
    
    % Criar a máscara para isolar o amarelo
    mascara_amarelo = (H >= limiar_h_min) & (H <= limiar_h_max) & (S >= 0.01);
    
    % Aplicar a máscara para isolar o amarelo na imagem
    imagem_amarela = A;
    imagem_amarela(repmat(~mascara_amarelo, [1, 1, 3])) = 0;
    
    subplot(1, 4, 4);
    imshow(imagem_amarela);
    title('Amarelo Isolado (sem ruído)');
    
    % Explicação do resultado segundo o diagrama HSV
    % No modelo HSV, o canal H representa a tonalidade (matiz), onde valores próximos de 0 correspondem ao vermelho
    % e valores próximos de 1 correspondem também ao vermelho, com transições intermediárias entre as cores. 
    % O intervalo [0.15, 0.2] no canal H geralmente corresponde à faixa de cores amarelas.
    % Ao isolar os pixels com H dentro deste intervalo, obtemos uma máscara que 
    % destaca a cor amarela na imagem original, eliminando outras cores
    
    % Explicação dos pixels de ruído (artefatos JPEG) e eliminação usando critérios de cor
    % Os pixels de ruído são artefatos introduzidos durante a compressão JPEG da imagem. 
    % Esses artefatos podem resultar em pequenas variações de cor que não estão presentes na imagem original.
    % Podemos eliminar esses pixels de ruído usando critérios de cor com um limiar de saturação (S) 
    % para distinguir entre os pixels puros e os pixels de ruído. 
    % Ao definir um limiar de saturação baixo, como 1%, podemos remover os pixels de ruído, 
    % pois estes tendem a ter uma saturação muito baixa.


end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all

    A = im2double(imread('ArteModerna1.jpg'));
    imagem_hsv = rgb2hsv(A);
    
    % Obter os canais H, S e V
    H = imagem_hsv(:, :, 1);
    S = imagem_hsv(:, :, 2);
    V = imagem_hsv(:, :, 3);
    
    % Definir os limiares para cada cor
    limiar_amarelo_min = 0.15;
    limiar_amarelo_max = 0.2;
    
    limiar_verde_min = 0.25;
    limiar_verde_max = 0.4;
    
    limiar_azul_min = 0.55;
    limiar_azul_max = 0.75;
    
    limiar_vermelho_min = 0;
    limiar_vermelho_max = 0.1;
    limiar_vermelho_min2 = 0.9;
    limiar_vermelho_max2 = 1.0;
    
    % Definir o limiar mínimo de saturação
    limiar_saturacao_min = 0.5;
    
    % Criar as máscaras para cada cor
    mascara_amarelo = (H >= limiar_amarelo_min) & (H <= limiar_amarelo_max) & (S >= limiar_saturacao_min);
    mascara_verde = (H >= limiar_verde_min) & (H <= limiar_verde_max) & (S >= limiar_saturacao_min);
    mascara_azul = (H >= limiar_azul_min) & (H <= limiar_azul_max) & (S >= limiar_saturacao_min);
    mascara_vermelho = ((H >= limiar_vermelho_min) & (H <= limiar_vermelho_max) | (H >= limiar_vermelho_min2) & (H <= limiar_vermelho_max2)) & (S >= limiar_saturacao_min);
    
    % Aplicar as máscaras nas respectivas cores
    imagem_amarelo = A;
    imagem_amarelo(repmat(~mascara_amarelo, [1, 1, 3])) = 0;
    
    imagem_verde = A;
    imagem_verde(repmat(~mascara_verde, [1, 1, 3])) = 0;
    
    imagem_azul = A;
    imagem_azul(repmat(~mascara_azul, [1, 1, 3])) = 0;
    
    imagem_vermelho = A;
    imagem_vermelho(repmat(~mascara_vermelho, [1, 1, 3])) = 0;
    
    figure;
    subplot(2, 2, 1);
    imshow(imagem_amarelo);
    title('Amarelo');
    
    subplot(2, 2, 2);
    imshow(imagem_verde);
    title('Verde');
    
    subplot(2, 2, 3);
    imshow(imagem_azul);
    title('Azul');
    
    subplot(2, 2, 4);
    imshow(imagem_vermelho);
    title('Vermelho');

end

%% Ex6 -------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ': Opcional - Não realizado'])
  clearvars -except list_of_exercises % Delete all previously declared vars

end

%% Ex7 -------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    A = imread('feet2.jpg');
    imagem_hsv = rgb2hsv(A);
    
    % Obter os canais H, S e V
    H = imagem_hsv(:, :, 1);
    S = imagem_hsv(:, :, 2);
    V = imagem_hsv(:, :, 3);
    
    % Definir os limiares mínimos para S e V
    limiar_saturacao_min = 0.4;
    limiar_intensidade_min = 0.2;
    
    % Criar as máscaras para cada cor
    mascara_amarelo = (S > limiar_saturacao_min) & (V > limiar_intensidade_min) & (H >= 0.11 & H <= 0.2);
    mascara_verde = (S > limiar_saturacao_min) & (V > limiar_intensidade_min) & (H >= 0.21 & H <= 0.45);
    mascara_azul = (S > limiar_saturacao_min) & (V > limiar_intensidade_min) & (H >= 0.46 & H <= 0.75);
    mascara_vermelho = (S > limiar_saturacao_min) & (V > limiar_intensidade_min) & ((H >= 0 & H <= 0.1) | (H >= 0.9 & H <= 1));
    
    % Aplicar operações morfológicas para eliminar ruído e imperfeições
    se = strel('disk', 5);
    mascara_amarelo = imopen(mascara_amarelo, se);
    mascara_verde = imopen(mascara_verde, se);
    mascara_azul = imopen(mascara_azul, se);
    mascara_vermelho = imopen(mascara_vermelho, se);
    
    % Aplicar as máscaras nas respectivas cores
    imagem_amarelo = A;
    imagem_amarelo(repmat(~mascara_amarelo, [1, 1, 3])) = 0;
    
    imagem_verde = A;
    imagem_verde(repmat(~mascara_verde, [1, 1, 3])) = 0;
    
    imagem_azul = A;
    imagem_azul(repmat(~mascara_azul, [1, 1, 3])) = 0;
    
    imagem_vermelho = A;
    imagem_vermelho(repmat(~mascara_vermelho, [1, 1, 3])) = 0;
    

    figure()
    subplot(2, 2, 1);
    imshow(imagem_amarelo);
    title('Amarelo');
    
    subplot(2, 2, 2);
    imshow(imagem_azul);
    title('Azul');
    
    subplot(2, 2, 3);
    imshow(imagem_verde);
    title('Verde');
    
    subplot(2, 2, 4);
    imshow(imagem_vermelho);
    title('Vermelho');
  
end

%% Ex8 -------------------------------------------------------------------
exercise = 'Ex8'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all

    A = im2double(imread('morangos.jpg'));

    % Converter a imagem para o modelo de cor HSV
    imagem_hsv = rgb2hsv(A);
    
    % Obter os canais H, S e V
    H = imagem_hsv(:, :, 1);
    S = imagem_hsv(:, :, 2);
    V = imagem_hsv(:, :, 3);
    
    % Criar as máscaras para cada cor
    red_mask = ((H >= 0) & (H <= 0.1) | (H >= 0.9) & (H <= 1)) & (S > 0.65) & (S < 0.81);
    bin = and(red_mask, V > 0.1);
    
    % Aplicar operações morfológicas para eliminar ruído e imperfeições
    bin = bwareaopen(bin,100);
    bin = bwmorph(bin,'close');
    bin = imfill(bin,"holes");

    imshow(bin)
  
end

%% Ex9 -------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

  % add your code here ...
    close all

    for i=1:7
        if i==1
          A = im2double(imread('morangos.jpg'));
        else
          A = im2double(imread(['morangos',num2str(i),'.jpg']));
        end
    
        % Converter a imagem para o modelo de cor HSV
        imagem_hsv = rgb2hsv(A);
        
        % Obter os canais H, S e V
        H = imagem_hsv(:, :, 1);
        S = imagem_hsv(:, :, 2);
        V = imagem_hsv(:, :, 3);
        
        % Criar as máscaras para cada cor
        red_mask = ((H >= 0) & (H <= 0.1) | (H >= 0.9) & (H <= 1)) & (S > 0.65) & (S < 0.81);
        bin = and(red_mask, V > 0.1);
        
        % Aplicar operações morfológicas para eliminar ruído e imperfeições
        bin = bwareaopen(bin,100);
        bin = bwmorph(bin,'close');
        bin = imfill(bin,"holes");
    
        subplot(3,3,i+2)
        stats = regionprops(bin, 'Centroid','EquivDiameter');
        centroids = cat(1, stats.Centroid);
        imshow(A)
        hold on
        viscircles(centroids, [stats.EquivDiameter], 'Color', 'b');
    end
  
end
