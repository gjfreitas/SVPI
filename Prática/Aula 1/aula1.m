%% Aula 1 - SVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       14/02/2023

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
  'Ex1a'
  'Ex1b'
  'Ex2a'
  'Ex2b'
  'Ex3a'
  'Ex3b'
  'Ex3c'
  'Ex3d'
  'Ex4a'
  'Ex4b'
  'Ex4c'
  'Ex4d'
  'Ex4e'
  'Ex5'
  'desafio'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1a -------------------------------------------------------------------

exercise = 'Ex1a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises

    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
  
    % add your code here ...   
    Z = zeros(100,200);
    imshow(Z)
   
end

%% Ex1b -------------------------------------------------------------------
exercise = 'Ex1b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    clearvars -except list_of_exercises exercise
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
  
    % add your code here ...
    Z = zeros(100,200);
    Z(30:70,:) = 255;
    figure(1)
    imshow(Z)
    
    Z = zeros(100,200);
    Z(30:70,50:90) = 255;
    figure(2)
    imshow(Z)
  
end

%% Ex2a -------------------------------------------------------------------
exercise = 'Ex2a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    % add your code here ...
    Z = zeros(100,200);
    Z(30:70,50:90) = 255;
    Z(30:70,120:160) = 128;
    imshow(Z)
  
end

%% Ex2b -------------------------------------------------------------------
exercise = 'Ex2b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    % Usando doubles 
    Z = zeros(100,200); %gera doubles
    Z(30:70, 50:90) = 1; %branco
    Z(30:70, 120:160) = 0.5; %cinzento
    figure(1)
    imshow(Z)

    %Usando %uint8’
    Z = zeros(100,200,'uint8'); %gera uint8 (0-255)
    %ou em alternativa: Z=uint8(zeros(100,200)))
    Z(30:70, 50:90) = 255;
    Z(30:70, 120:160) = 128;
    figure(2)
    imshow(Z)

  
end

%% Ex3a -------------------------------------------------------------------

exercise = 'Ex3a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars
  
    % add your code here ...
    % No ficheiro AddSquare.m

end

%% Ex3b -------------------------------------------------------------------
exercise = 'Ex3b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % invoca a função AddSquare criada no passo 3a
  Z = zeros(100,200);
  Z = AddSquare(Z,20,30);
  imshow(Z)
  

end

%% Ex3c -------------------------------------------------------------------
exercise = 'Ex3c'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % invoca a função AddSquare criada no passo 3a
  Z = zeros(100,200);
  for cc=10:20:180
      Z = AddSquare(Z,10,cc);
  end

  imshow(Z)  

end

%% Ex3d -------------------------------------------------------------------
exercise = 'Ex3d'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % invoca a função AddSquare criada no passo 3a
  Z = zeros(100,200);
  for ll=10:20:100
      for cc=10:20:200
          Z = AddSquare(Z,ll,cc);
      end
  end

  imshow(Z)  

end

%% Ex4a -------------------------------------------------------------------
exercise = 'Ex4a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  Z = zeros(100,200);
  x0 = 50; y0 = 60; r = 20;
  for x=1:200
      for y=1:100
          if (x-x0)^2+(y-y0)^2 <= r^2
              Z(y,x) = 1;
          end
      end
  end

  imshow(Z)

end

%% Ex4b -------------------------------------------------------------------
exercise = 'Ex4b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  Z = zeros(100,200);
  x0 = 50; y0 = 60; r = 20;
  x = 1:size(Z,2);
  y = 1:size(Z,1);
  [X,Y] = meshgrid(x,y);
  C = (((X-x0).^2 + (Y-y0).^2) <= r*r);
  Z(C) = 1;
  imshow(Z)

  
end

%% Ex4c -------------------------------------------------------------------
exercise = 'Ex4c'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % no ficheiro AddCircle.m
 
end

%% Ex4d -------------------------------------------------------------------
exercise = 'Ex4d'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % invoca a função AddSquare criada no passo 4c
  close all
  Z = zeros(100,200);
  r = 11;
  for ll=13:25:100
      for cc=13:25:200
          Z = AddCircle(Z,cc,ll,r);
      end
  end

  imshow(Z)  

end

%% Ex4e -------------------------------------------------------------------
exercise = 'Ex4e'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % invoca a função AddSquare criada no passo 4c
  close all
  Z = zeros(100,200);
  for ll=13:25:100
      for cc=13:25:200
          r = 5 + (5-1).*rand(); % gera valores entre 1 e 5 para o raio
          Z = AddCircle(Z,cc,ll,r);
      end
  end

  imshow(Z)  

end


%% Ex5 (Op.) -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  % invoca a função AddHeart
  close all
  Z = zeros(100,200);
  fact = 30;
  x0 = 100/fact;
  y0 = 50/fact;
  Z = AddHeart(Z, x0, y0,fact);

  imshow(flipud(Z))  

end

%% Desafio-------------------------------------------------------------------
exercise = 'desafio'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  Z = zeros(100,200);
  for ll=20:15:80
      for cc=20:40:180
          size = randi([5,20]);
          color = rand();
          Z = AddSquare_Color(Z,ll,cc, size, color);
      end
  end

  imshow(Z)  

end

