%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       09/05/2023

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
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  %close all
    img_original = imread("TP2_img_01_01b.png");

    modelo1 = imread("tesoura_org_template.png");
    
    % Obter a matriz de correlação cruzada normalizada para o modelo 1
    cc1 = normxcorr2(modelo1, img_original);
    
    % Obter as coordenadas do objeto detectado usando o índice com o valor máximo na matriz de correlação cruzada
    [max_cc1, index_cc1] = max(cc1(:));
    [y_cc1, x_cc1] = ind2sub(size(cc1), index_cc1);
    coord_x1 = x_cc1 - size(modelo1,2)/2;
    coord_y1 = y_cc1 - size(modelo1,1)/2;
    
    % Rotular os objetos na imagem original
    rotulo_img = bwlabel(img_original);
    
    % Calcular os centróides de cada objeto rotulado
    stats = regionprops(rotulo_img, 'Centroid', 'BoundingBox');
    centroide = cat(1, stats.Centroid);
    
    % Calcular as distâncias dos centróides de todos os objetos ao ponto com a maior correlação cruzada
    distancias = sqrt((centroide(:,1) - coord_x1).^2 + (centroide(:,2) - coord_y1).^2);
    
    % Determinar o número do objeto com a menor distância ao ponto com a maior correlação cruzada
    [menor_distancia, num_objeto] = min(distancias);
    
    % Obter as coordenadas do centróide do objeto com a menor distância
    centroide_menor_distancia = centroide(num_objeto,:);
    
    % Plotar a imagem original com o centróide do objeto com a menor distância e a bounding box
    figure()
    imshow(img_original);
    hold on;
    plot(centroide_menor_distancia(1), centroide_menor_distancia(2), 'r*', 'MarkerSize', 10);
    rectangle('Position', stats(num_objeto).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
    
    % Repetição do processo para o modelo 2
    modelo2 = imread("pa_org_template.png");
    
    % Obter a matriz de correlação cruzada normalizada para o modelo 2
    cc1 = normxcorr2(modelo2, img_original);
    
    % Obter as coordenadas do objeto detectado usando o índice com o valor máximo na matriz de correlação cruzada
    [max_cc1, index_cc1] = max(cc1(:));
    [y_cc1, x_cc1] = ind2sub(size(cc1), index_cc1);
    coord_x1 = x_cc1 - size(modelo1,2)/2;
    coord_y1 = y_cc1 - size(modelo1,1)/2;
    
    % Rotular os objetos na imagem original
    rotulo_img = bwlabel(img_original);
    
    % Calcular os centróides de cada objeto rotulado
    stats = regionprops(rotulo_img, 'centroid', 'BoundingBox');
    centroide = cat(1, stats.Centroid);
    
    % Calcular as distâncias dos centróides de todos os objetos ao ponto com a maior correlação cruzada
    distancias = sqrt((centroide(:,1) - coord_x1).^2 + (centroide(:,2) - coord_y1).^2);
    
    % Determinar o número do objeto com a menor distância ao ponto com a maior correlação cruzada
    [menor_distancia, num_objeto] = min(distancias);
    
    % Obter as coordenadas do centróide do objeto com a menor distância
    centroide_menor_distancia = centroide(num_objeto,:);
    
    % Plotar a imagem original com o centróide do objeto com a menor distância e a bounding box
    plot(centroide_menor_distancia(1), centroide_menor_distancia(2), 'b*', 'MarkerSize', 10);
    rectangle('Position', stats(num_objeto).BoundingBox, 'EdgeColor', 'b', 'LineWidth', 2);

  
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 %close all
    model = imread('pa_org_template.png');
    model_rot = imrotate(model, 45);
    
    img = imread('TP2_img_01_01b.png');
    objects = regionprops(img, 'Orientation', 'Image', 'BoundingBox');
    
    threshold = 0.7;
    matches = [];
    for i = 1:length(objects)
        obj = objects(i);
        obj_img = imrotate(obj.Image, -obj.Orientation);
    
        % Padding da matriz de procura com zeros
        pad_size = size(model_rot) - size(obj_img);
        if any(pad_size < 0)
            obj_img = imresize(obj_img, size(model_rot));
        else
            obj_img = padarray(obj_img, floor(pad_size/2), 0, 'both');
            obj_img = padarray(obj_img, ceil(pad_size/2), 0, 'post');
        end
    
        corr = normxcorr2(model_rot, obj_img);
        max_corr = max(corr(:));
        if max_corr > threshold
            matches = [matches; i max_corr];
        end
    end
    
    figure()
    imshow(img); hold on;
    for i = 1:size(matches, 1)
        obj = objects(matches(i, 1));
        rectangle('Position', obj.BoundingBox, 'EdgeColor', 'g', 'LineWidth', 2);
    end
  
end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  %close all
    % Passo 1: Ler a imagem
    img = imread("TP2_img_01_01b.png");

    figure(10)
    imshow(img)
    hold on
    
    
    
    % Passo 2: Pré-processamento (Eliminar objetos com Área < 200)
    bw = bwareaopen(img, 200);
    
    % Passo 3: Calcular descritores
    stats = regionprops(bw, 'Area', 'Centroid', 'Eccentricity', 'Solidity', 'Perimeter', 'Circularity', 'BoundingBox');
    % ffa = 4*pi*[stats.Perimeter]./[stats.Area];
    ffa = [stats.Circularity];
    sol = [stats.Solidity];
    ecc = [stats.Eccentricity];
    
    % Passo 4: Criar vetor de padrões
    Patts = [ffa' sol' ecc'];
    
    
    % Passo 5: Definir padrões dos objetos
    pA = [0.2163 0.5354 0.9871]; % padrão de pás
    pB = [0.4121 0.8289 0.9712]; % padrão de serrotes
    
    figure(11)
    imshow(img)
    
    
    for n=1:length(Patts)
        % Passo 6: Calcular distância Euclidiana
        dA(n) = norm(Patts(n,:)-pA);
        dB(n) = norm(Patts(n,:)-pB);
        Table(n,:) = [Patts(n,1), Patts(n,2), Patts(n,3), dA(n), dB(n)];
    
        
        % Passo 7: Representação
        mstr = num2str(Patts(n,:)',3);
        
        figure(10)
        hold on
        text(stats(n).Centroid(1)+10, stats(n).Centroid(2), mstr, 'Color', [1 0 0], 'BackgroundColor', [0 0 0]);
        text(stats(n).Centroid(1)-10, stats(n).Centroid(2), num2str(n), 'Color', [0 1 0], 'BackgroundColor', [0 0 0]);
    
        figure(11)
        hold on
        if dA(n) < 0.01
            rectangle('Position', stats(n).BoundingBox, 'EdgeColor', 'b', 'LineWidth', 2);
        end
        if dB(n) < 0.02
            rectangle('Position', stats(n).BoundingBox, 'EdgeColor', 'g', 'LineWidth', 2);
        end
    end
  
end

%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  %close all
    % Passo 1: Ler a imagem
    img = imread("TP2_img_01_01b.png");
    
    figure(12)
    imshow(img)
    hold on
    
    
    
    % Passo 2: Pré-processamento (Eliminar objetos com Área < 200)
    bw = bwareaopen(img, 200);
    
    % Passo 3: Calcular descritores
    stats = regionprops(bw, 'Area', 'Centroid', 'Eccentricity', 'Solidity', 'Perimeter', 'Circularity', 'BoundingBox');
    % ffa = 4*pi*[stats.Perimeter]./[stats.Area];
    ffa = [stats.Circularity];
    sol = [stats.Solidity];
    ecc = [stats.Eccentricity];
    
    % Passo 4: Criar vetor de padrões
    Patts = [ffa' sol' ecc'];
    
    % Passo 5: Definir os pradões
    PattsA = Patts([1 12 14 16 17 18],:);
    PattsB = Patts([4 6 19],:);
    
    % Passo 6: Calcular distância Mahalanobis
    DA = mahal(Patts, PattsA);
    DA = DA/max(DA);
    
    DB = mahal(Patts, PattsB);
    DB = DB/max(DB);
    
    Table(:,1:3) = Patts;
    Table(:,4) = DA;
    Table(:,5) = DB;
    
    figure(13)
    imshow(img)
    
    for n=1:length(Patts)
        
        % Passo 7: Representação
        mstr = num2str(Patts(n,:)',3);
        
        figure(12)
        hold on
        text(stats(n).Centroid(1)+10, stats(n).Centroid(2), mstr, 'Color', [1 0 0], 'BackgroundColor', [0 0 0]);
        text(stats(n).Centroid(1)-10, stats(n).Centroid(2), num2str(n), 'Color', [0 1 0], 'BackgroundColor', [0 0 0]);
    
        figure(13)
        hold on
        if DA(n) <= 0.0001
            rectangle('Position', stats(n).BoundingBox, 'EdgeColor', 'b', 'LineWidth', 2);
        end
        if DB(n) <= 0.0001
            rectangle('Position', stats(n).BoundingBox, 'EdgeColor', 'g', 'LineWidth', 2);
        end
    end

end


