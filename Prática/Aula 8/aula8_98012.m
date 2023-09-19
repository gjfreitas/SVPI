%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       2022/23

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
  'Ex1'
  'Ex2'
  'Ex3'
  'Ex4a'
  'Ex4b'
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

    % Carregar imagem
    img = imread('nuts2a.jpg');
    
    % Converter para escala de cinza
    img_gray = rgb2gray(img);
    subplot(1,3,1)
    imshow(img_gray)
    
    % Binarização
    img_bw = ~imbinarize(img_gray);
    
    
    % Preenchimento de buracos
    img_filled = imfill(img_bw, 'holes');
    subplot(1,3,2)
    imshow(img_filled)
    
    % Remoção de objetos no bordo
    img_no_border = imclearborder(img_filled);
    subplot(1,3,3)
    imshow(img_no_border)
    
    % Fechamento da imagem
    img_closed = imclose(img_no_border, strel('disk', 5));
    
    % Identificação dos objetos
    img_labeled = bwlabel(img_closed);
    
    % Exibir cada objeto em uma imagem isolada
    num_objects = max(max(img_labeled));
    figure()
    for i = 1:num_objects
        subplot(3, 4, i);
        imshow(img_labeled == i);
    end
 
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 close all

    A = rgb2gray(imread('traffic_signs.jpg'));
    subplot(1,3,1)
    imshow(A)

    B = ~imbinarize(A);
    subplot(1,3,2)
    imshow(B)

    Fill = imfill(B,'holes');
    subplot(1,3,3)
    imshow(Fill)

    CL = bwmorph(Fill,'close');

    [L, N] = bwlabel(CL);

    stats = regionprops(L, "Circularity", "Centroid");

    ff = [stats.Circularity];

    trLim = 0.68;
    cirLim = 0.9;
    
    triidx = find(ff < trLim);
    ciridx = find(ff > cirLim);
    squidx = find(ff > trLim & ff < cirLim);

    TRI = ismember(L, triidx);
    CIRC = ismember(L, ciridx);
    SQUAD = ismember(L, squidx);

    figure()
    subplot(1,3,1), imshow(TRI); title('Triangles')
    subplot(1,3,2), imshow(CIRC); title('Circles')
    subplot(1,3,3), imshow(SQUAD); title('Squares')

    figure()
    imshow(Fill)
    hold on
    for k=1:size(stats,1)
        x = stats(k).Centroid(1);
        y = stats(k).Centroid(2);

        text(x,y, {['Obj' num2str(k)], num2str(stats(k).Circularity)}, 'Color', 'b')
    end
  
end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all

    A = rgb2gray(imread('traffic_signs_jam1.jpg'));
    subplot(1,3,1)
    imshow(A)

    B = ~imbinarize(A);
    subplot(1,3,2)
    imshow(B)

    Fill = imfill(B,'holes');
    subplot(1,3,3)
    imshow(Fill)

    CL = bwmorph(Fill,'close');

    [L, N] = bwlabel(CL);

    stats = regionprops(L, "Circularity");

    ff = [stats.Circularity];

    trLim = 0.68;
    cirLim = 0.9;
    
    triidx = find(ff < trLim);
    ciridx = find(ff > cirLim);
    squidx = find(ff > trLim & ff < cirLim);

    TRI = ismember(L, triidx);
    CIRC = ismember(L, ciridx);
    SQUAD = ismember(L, squidx);

    figure()
    subplot(1,3,1), imshow(TRI); title('Triangles')
    subplot(1,3,2), imshow(CIRC); title('Circles')
    subplot(1,3,3), imshow(SQUAD); title('Squares')
end

%% Ex4a -------------------------------------------------------------------
exercise = 'Ex4a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all


    img = imread('talheres_individuais.jpg');
    img = ~imbinarize(img);
    
    L = bwlabel(img);
    
    stats = regionprops(logical(L), 'All');
    numObjects = length(stats);

    solidity = nan(numObjects,1); factors = solidity;

    for i = 1:numObjects
        solidity(i) = stats(i).Solidity;
        
        % Calculate the factor of form as the object's area divided by the square of its perimeter
        factors(i) = 4*pi*stats(i).Area / stats(i).Perimeter^2;
        %factors(i) = stats(i).Circularity;

        subplot(1,numObjects,i)
        imshow(L == i)
        str = sprintf('Solidity=%f \nFormFactor=%f',solidity(i), factors(i));
        xlabel(str)
    end

end

%% Ex4b -------------------------------------------------------------------
exercise = 'Ex4b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all


    img = imread('talheres.jpg');
    subplot(1,5,1)
    imshow(img)
    title('Imagem Original')
    BW = ~imbinarize(img);

    A = imclearborder(BW);
    
    subplot(1,5,2)
    imshow(A)
    str = sprintf('Imagem com \n bordos limpos');
    title(str)

    L = bwlabel(A);
    
    stats = regionprops(logical(L), 'Solidity', 'Area', 'Perimeter');
    numObjects = length(stats);

    solidity = [stats.Solidity];

    for i = 1:numObjects
        % Calculate the factor of form as the object's area divided by the square of its perimeter
        factors(i) = 4*pi*stats(i).Area / stats(i).Perimeter^2;
    end

    solidity_garfo = 0.6936;
    solidity_faca = 0.7561;
    solidity_colher = 0.7221;
    form_garfo = 0.1100;
    form_faca = 0.2468;
    form_colher = 0.2447;
    error = 0.03; % error = 0.02;
    upper_error = 1 + error;
    lower_error = 1 - error;
    
    garfos_idx  = find(solidity <= solidity_garfo*upper_error  & solidity >= solidity_garfo*lower_error & factors <= form_garfo*upper_error  & factors >= form_garfo*lower_error);
    facas_idx = find(solidity <= solidity_faca*upper_error & solidity >= solidity_faca*lower_error & factors <= form_faca*upper_error  & factors >= form_faca*lower_error);
    colheres_idx = find(solidity <= solidity_colher*upper_error & solidity >= solidity_colher*lower_error & factors <= form_colher*upper_error  & factors >= form_colher*lower_error);

    Garfos = ismember(L, garfos_idx);
    Facas = ismember(L, facas_idx);
    Colheres = ismember(L, colheres_idx);

    subplot(1,5,3), imshow(Garfos); title('Garfos')
    subplot(1,5,4), imshow(Colheres); title('Colheres')
    subplot(1,5,5), imshow(Facas); title('Facas')

end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all

    img = imread('TP2_img_01_01.png');
    subplot(1,3,1)
    imshow(img)
    
    img_gray = rgb2gray(img);
    
%     img_bin = imbinarize(img_gray, 'adaptive');  
    img_bin = imbinarize(img_gray, 0.06);
    subplot(1,3,2)
    imshow(img_bin)
    
    % Remove objetos do bordo
    img_bin = imclearborder(img_bin);
%     img_bin = imclose(img_bin, ones(3));

    subplot(1,3,3)
    imshow(img_bin)
    
    % Identifica os objetos na imagem
    [img_labels, num_obj] = bwlabel(img_bin);
    
    % Calcula as propriedades dos objetos
    props = regionprops(img_labels, 'Area', 'Perimeter', 'Circularity');
    
    % Separa os objetos por área e descarta os menores que 100 pixels
    for i = 1:num_obj
        if props(i).Area < 100
            img_labels(img_labels == i) = 0;
        end
    end

%     subplot(1,4,4)
%     img_f = label2rgb(img_labels);
%     imshow(img_f)
    
    % % Salva a imagem de saída com os objetos separados
    % imwrite(label2rgb(img_labels), 'output.png');

end

%% Ex6 -------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all

    img = imread('TP2_img_01_01.png');
    img_gray = rgb2gray(img);
    img_bin = imbinarize(img_gray, 0.06);
    
    
    % Remove objetos do bordo
    img_bin = imclearborder(img_bin);

    img_bin = bwmorph(img_bin, 'close');

    subplot(1,4,1)
    imshow(img_bin)
    
    % Identifica os objetos na imagem
    [img_labels, num_labels] = bwlabel(img_bin);

    euler = regionprops(img_labels, 'EulerNumber');
    
    % Números de Euler
    N_Euler = [euler.EulerNumber];

    % Um buraco -> Euler = 0
    buraco1 = (N_Euler == 0);
    idxs_buraco1 = find(buraco1);
    ferramentas_buraco1= ismember(img_labels, idxs_buraco1);

    subplot(1, 4, 3)
    imshow(ferramentas_buraco1)
    title("Ferramentas com 1 Buraco")

    % Zero buracos  -> Euler = 1
    condicao_buraco0 = (N_Euler == 1);
    idxs_buraco0 = find(condicao_buraco0);
    ferramentas_buraco0 = ismember(img_labels, idxs_buraco0);

    subplot(1, 4, 4)
    imshow(ferramentas_buraco0)
    title("Ferramentas com 0 Buracos")

    % Dois buracos  -> Euler = -1
    condicao_buraco2 = (N_Euler == -1);
    idxs_buraco2 = find(condicao_buraco2);
    ferramentas_buraco2 = ismember(img_labels, idxs_buraco2);

    subplot(1, 4, 2)
    imshow(ferramentas_buraco2)
    title("Ferramentas com 2 Buracos")
   

end

%% Ex7 -------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all

    img = imread('TP2_img_01_01.png');
    img_gray = rgb2gray(img);
    bw = imbinarize(img_gray, 0.06);
    
    % Remove objetos do bordo
    B = imclearborder(bw);

    B = bwmorph(B,'close');

    L=bwlabel(B); %obter matriz de 'labels'
    s=regionprops(L,'All'); %obter lista das propriedades todas
    soli=[0 0.5 0.6 0.7 1]; %limites dos intervalos
    lins= 2; cols=2; %medidas para o subplot
    for i=2:numel(soli)
        idx=find([s.Solidity]>soli(i-1)&[s.Solidity]<=soli(i));
        m=ismember(L,idx); %imagem binaria dos objetos detetados
        subplot(lins,cols,i-1); imshow(m);
        str=sprintf('Sol>%0.2f&Sol<=%0.2f',soli(i-1),soli(i));
        title(str);
    end

end

%% Ex8 -------------------------------------------------------------------
exercise = 'Ex8'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all

    img = imread('TP2_img_01_01.png');
    img_gray = rgb2gray(img);
    bw = imbinarize(img_gray, 0.06);
    
    % Remove objetos do bordo
    B = imclearborder(bw);
    B = bwmorph(B,'close');

    L=bwlabel(B); %obter matriz de 'labels'
    s=regionprops(L,'All'); %obter lista das propriedades todas
    soli=[0.0 0.94 0.96 0.98 1.00]; %limites dos intervalos
    lins= 2; cols=2; %medidas para o subplot
    for i=2:numel(soli)
        idx=find([s.Eccentricity]>soli(i-1)&[s.Eccentricity]<=soli(i));
        m=ismember(L,idx); %imagem binaria dos objetos detetados
        subplot(lins,cols,i-1); imshow(m);
        str=sprintf('Ecc>%0.2f&Ecc<=%0.2f',soli(i-1),soli(i));
        title(str);
    end

end

%% Ex9 -------------------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars

 % add your code here ...
 close all

    img = imread('TP2_img_01_01.png');
    img_gray = rgb2gray(img);
    bw = imbinarize(img_gray, 0.06);
    
    % Remove objetos do bordo
    B = imclearborder(bw);
    B = bwmorph(B,'close');

    L=bwlabel(B); %obter matriz de 'labels'
    s=regionprops(L,'All'); %obter lista das propriedades todas
    soli=[0.0 0.15 0.2 0.3 1.0]; %limites dos intervalos
    lins= 2; cols=2; %medidas para o subplot
    for i=2:numel(soli)
        idx=find([s.Circularity]>soli(i-1)&[s.Circularity]<=soli(i));
        m=ismember(L,idx); %imagem binaria dos objetos detetados
        subplot(lins,cols,i-1); imshow(m);
        str=sprintf('FF>%0.2f&FF<=%0.2f',soli(i-1),soli(i));
        title(str);
    end

end