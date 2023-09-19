%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       21/03/2023

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
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
    img = im2double(imread('coins.png'));
     
    Sx = [-1 0 1; -2 0 2; -1 0 1];
    Sy = [-1 -2 -1; 0 0 0; 1 2 1];
    
    Gx = filter2(Sx,img);
    Gy = filter2(Sy,img);
    
    figure(1)
    subplot(1,3,1)
    imshow(abs(Gx))
    title('|G_x|')
    
    subplot(1,3,2)
    imshow(abs(Gy))
    title('|G_y|')
    
    subplot(1,3,3)
    imshow(abs(Gx) + abs(Gy))
    title('|G_x| + |G_y|')
  
  
end

%% Ex2 -------------------------------------------------------------------
exercise = 'Ex2'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 close all
    img = im2double(imread('coins.png'));
    [Gx,Gy] = imgradientxy(img,'sobel');
    [Gmag,Gdir] = imgradient(Gx,Gy); %[Gmag,Gdir]=imgradient(img,'sobel');
    
    figure(2)
    subplot(1,4,1)
    imshow(abs(Gx),[])
    title('Sobel |G_x| norm')
    
    subplot(1,4,2)
    imshow(abs(Gy),[])
    title('Sobel |G_y| norm')
    
    subplot(1,4,3)
    imshow(abs(Gx) + abs(Gy),[])
    title('Sobel |G_x| + |G_y| norm')
    
    subplot(1,4,4)
    imshow(Gdir,[])
    title('Sober \theta norm')
  
end

%% Ex3 -------------------------------------------------------------------
exercise = 'Ex3'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 close all
    img = im2double(imread('coins.png'));
    B = edge(img,'sobel');
    
    imshow(B)
  
end

%% Ex4 -------------------------------------------------------------------

exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    img = im2double(imread('coins.png'));
    
    
    figure(1)
    subplot(2,2,1)
    B = edge(img,'sobel');
    imshow(B)
    
    title('Sobel')
    subplot(2,2,2)
    B = edge(img,'canny');
    imshow(B)
    title('Canny')
    
    subplot(2,2,3)
    B = edge(img,'prewitt');
    imshow(B)
    title('Prewitt')
    
    subplot(2,2,4)
    B = edge(img,'log');
    imshow(B)
    title('Log')
end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    T_img = im2double(imread('Tcomluz.jpg'));
    
    figure(1)
    subplot(2,2,1)
    B = edge(T_img,'sobel');
    imshow(B)
    
    title('Sobel')
    subplot(2,2,2)
    B = edge(T_img,'canny');
    imshow(B)
    title('Canny')
    
    subplot(2,2,3)
    B = edge(T_img,'prewitt');
    imshow(B)
    title('Prewitt')
    
    subplot(2,2,4)
    B = edge(T_img,'log');
    imshow(B)
    title('Log')


end

%% Ex6 -------------------------------------------------------------------
exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    cam = webcam();
    h = figure();
    while isvalid(h)
        A = snapshot(cam);
        imshow(A)
        % completar codigo aqui
        Igray = rgb2gray(A);
        
        % Detetar as arestas usando o algoritmo Sobel
        Iedge_sobel = edge(Igray,'sobel');
        
        % Detetar as arestas usando o algoritmo Canny
        Iedge_canny = edge(Igray,'canny');
        
        % Mostrar as imagens
        subplot(1,3,1)
        imshow(A)
        title('Imagem original')
        subplot(1,3,2)
        imshow(Iedge_sobel)
        title('Arestas detetadas com Sobel')
        subplot(1,3,3)
        imshow(Iedge_canny)
        title('Arestas detetadas com Canny')
        
        % Pausar o loop por um curto intervalo para atualizar a imagem
        pause(0.05)
    end
    clear cam

end

%% Ex7 -------------------------------------------------------------------
exercise = 'Ex7'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all

    A = im2double(imread('coins.png'));
    Z = edge(A,'sobel');
    X = false(size(Z)); % explain - cria uma matriz de 0's com as dimensões de Z
    
    subplot(1,2,1), imshow(Z)
    title('All edges')
    
    subplot(1,2,2), imshow(X),  hold on
    title('Selected edges')
    
    minSize = 100; % minimal size of individual edges
    
    [L,N] = bwlabel(Z); % explain
    % L = bwlabel(BW,N) returns a matrix L, of the same size as BW,
    % containing labels for the connected components in BW. N can have a
    % value of either 4 or 8, where 4 specifies 4-connected objects and 8
    % specifies 8-connected objects; if the argument is omitted, it defaults
    % to 8.
    
    for k=1:N
        C = (L==k); % explain - mascara de cada um dos objetos
        if ( sum(sum(C)) < minSize ), continue; end % explain - ignorar as edges de tamanho inferior a minSize
        X = X | C;
        subplot(1,2,2), imshow(X),
        pause(0.2) %why? - para ver o processo
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

    A = im2double(imread('coins.png'));
    Z = edge(A,'canny');
    X = false(size(Z)); % explain - cria uma matriz de 0's com as dimensões de Z
    
    subplot(1,3,1), imshow(Z)
    title('All edges')
    
    subplot(1,3,2), imshow(X),  hold on
    title('Large edges')
    
    mSize = 160;
    
    [L,N] = bwlabel(Z); %explain
    % L = bwlabel(BW,N) returns a matrix L, of the same size as BW,
    % containing labels for the connected components in BW. N can have a
    % value of either 4 or 8, where 4 specifies 4-connected objects and 8
    % specifies 8-connected objects; if the argument is omitted, it defaults
    % to 8.
    
    for k=1:N
    C = (L==k); % explain - mascara de cada um dos objetos
    if ( sum(sum(C)) < mSize ), continue; end % explain - ignorar as edges de tamanho inferior a minSize
    X = X | C;
    subplot(1,3,2), imshow(X),
    %pause(0.2) %why? - para ver o processo
    end
    
    X = false(size(Z));
    subplot(1,3,3), imshow(X),  hold on
    title('Small edges')
    
    for k=1:N
    C = (L==k); % explain - mascara de cada um dos objetos
    if ( sum(sum(C)) >= mSize ), continue; end % explain - ignorar as edges de tamanho superior ou igual a minSize
    X = X | C;
    subplot(1,3,3), imshow(X),
    %pause(0.2) %why? - para ver o processo
    end
  
end


%% Ex9 (Opcional) ---------------------------------------------------------
exercise = 'Ex9'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 close all

    A = im2double(imread('coins.png'));
    Z = edge(A,'sobel');
    X = false(size(Z));
    
    subplot(1,2,1), imshow(Z), hold on, axis on
    title({'Edges overlayed with'},{'larger outer countours'})
    myAxis = axis;
    
    subplot(1,2,2),  hold on, axis ij, axis equal, axis(myAxis), grid on
    title({'Separate plot of the'},{'larger outer countours'})
    
    minSize = 100;
    [L,N] = bwlabel(Z);
    
    for k=1:N
        C = (L==k);
        if ( nnz(C) < minSize ), continue; end
    
        BB = bwboundaries(C, 'noholes');
        boundary = BB{1};
    
        subplot(1,2,1)
        plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth',4)
    
        subplot(1,2,2)
        plot(boundary(:,2), boundary(:,1), 'b')
    
        pause(0.5)
    end
  
end



%% Ex10 (Opcional) --------------------------------------------------------
exercise = 'Ex10'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 close all

    A = im2double(imread('Tcomluz.jpg'));
    img_gaussian = imgaussfilt(A);
    edges = edge(img_gaussian, 'canny');    
    boundaries = bwboundaries(edges);
    num_boundaries = length(boundaries);
    largest_boundary = 0;
    largest_boundary_size = 0;
    for i = 1:num_boundaries
        boundary = boundaries{i};
        boundary_size = size(boundary, 1);
        if boundary_size > largest_boundary_size
            largest_boundary = boundary;
            largest_boundary_size = boundary_size;
        end
    end
    overlay = imoverlay(A, edges, [1 0 0]);
    imshow(overlay);


  
end
