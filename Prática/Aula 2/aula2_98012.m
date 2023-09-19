%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       22/02/2023

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
  'Ex2c'
  'Ex3a'
  'Ex3b'
  'Ex3c'
  'Ex4a'
  'Ex4b'
  'Ex4c'
  'Ex5'
  'Ex6'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1a -------------------------------------------------------------------

exercise = 'Ex1a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    P = [3 0]'; % ou P = [3;0];
    plot(P(1),P(2),'*')
    a = pi/3;
    Rot = [cos(a) -sin(a); sin(a) cos(a)];
    axis([-1 4 -1 4])
    hold on; grid on; axis square
    Pc = Rot*P;
    plot(Pc(1),Pc(2),'*r')
  
  
end

%% Ex1b -------------------------------------------------------------------
exercise = 'Ex1b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
%     clear all
    close all
    clc
    
    P = [3 0]'; % ou P = [3;0];
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    N = 20;
    angs = linspace(0,2*pi,N); % N valores de 0 ate 2pi
    
    for a=angs
        Q = rota(a)*P;
        plot(Q(1),Q(2),'*r')
        pause(0.1);
    end
end

%% Ex2a -------------------------------------------------------------------
exercise = 'Ex2a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
%     clear all
    close all
    clc
    
    P = [3 0]'; % ou P = [3;0];
    h = plot(P(1), P(2), 'dr');
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    N = 100;
    angs = linspace(0,2*pi,N); % N valores de 0 ate 2pi
    
    for a=angs
        Q = rota(a)*P;
        set(h,'Xdata', Q(1), 'Ydata', Q(2))
        pause(0.1);
    end
  
end

%% Ex2b -------------------------------------------------------------------

exercise = 'Ex2b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
%     clear all
    close all
    clc
    
    P = [3 0]'; % ou P = [3;0];
    P2 = [2 0]';
    h = plot(P(1), P(2), 'dr');
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    N = 500;
    h2 = plot(P2(1), P2(2), 'ob');
    angs = linspace(0,10*pi,N); % N valores de 0 ate 10pi
    
    for a=angs
        Q = rota(a)*P;
        Q2 = rota(a)*P2;
        set(h,'Xdata', Q(1), 'Ydata', Q(2))
        set(h2,'Xdata', Q2(1), 'Ydata', Q2(2))
        pause(0.01);
    end
end

%% Ex2c -------------------------------------------------------------------
exercise = 'Ex2c'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    clc
    
    P = [3 0]'; % ou P = [3;0];
    P2 = [2 0]';
    h = plot(P(1), P(2), 'dr');
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    N = 500;
    h2 = plot(P2(1), P2(2), 'ob');
    angs = linspace(0,10*pi,N); % N valores de 0 ate 10pi
    
    for a=angs
        Q = rota(a)*P;
        Q2 = rota(2*a)*P2;
        set(h,'Xdata', Q(1), 'Ydata', Q(2))
        set(h2,'Xdata', Q2(1), 'Ydata', Q2(2))
        pause(0.01);
    end

end

%% Ex3a -------------------------------------------------------------------
exercise = 'Ex3a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    clc
    
    P = [-0.5 0.5 0; 0 0 2];
    
    
    h = fill(P(1,:), P(2,:), 'y');
    
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    N = 200;
    angs = linspace(0,10*pi,N); % N valores de 0 ate 10pi
     
%     P2 = [-0.5 0.5 0 -0.5; 0 0 2 0];
%     h2 = plot(P2(1,:), P2(2,:), '-b', 'LineWidth',4);
    for a=angs
        Q = rota(a)*P;
        set(h,'Xdata', Q(1,:), 'Ydata', Q(2,:))
%         Q2 = rota(a)*P2;
%         set(h2,'Xdata', Q2(1,:), 'Ydata', Q2(2,:))
        pause(0.05);
    end
end

%% Ex3b -------------------------------------------------------------------
exercise = 'Ex3b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    clc
    
    P = [-0.5 0.5 0; 0 0 2];
    P = P + repmat([3 0]', 1, size(P,2));
    h = fill(P(1,:), P(2,:),'y');
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    N = 500;
    angs = linspace(0,20*pi,N); % N valores de 0 ate 20pi
    
    for a=angs
        Q = rota(a)*P;
        set(h,'Xdata', Q(1,:), 'Ydata', Q(2,:))
        set(h, 'FaceColor', rand(1,3))
        pause(0.05);
    end
  
end

%% Ex3c -------------------------------------------------------------------
exercise = 'Ex3c'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    clc
    close all
    
    P = -4 + 4*rand(10, 2); % gera valores aleatorios e guarda numa matriz 10 por 2
    color = [rand,rand,rand];
    
    h = patch('Faces', 1:10, 'Vertices', P, 'FaceColor', color);
    axis([-5 5 -5 5])
    axis square
    title('Polígono aleatório')
    
    N = 200;
    angs = linspace(0,10*pi,N); % N valores de 0 ate 20pi
    for a = angs
        Q = P*rota(a);
        set(h, 'Vertices', Q)
        drawnow
        pause(0.1)
    end
  
end

%% Ex4a -------------------------------------------------------------------
exercise = 'Ex4a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    clc
    close all
    
    P = [-0.5 0.5 0; 0 0 2];
    % P = [-0.5 0.5 0 -0.5; 0 0 2 0];

    % homogeneização das coordenadas
    P = [P; ones(1, size(P,2))];

    h = fill(P(1,:), P(2,:),'y');
    axis([-4 4 -4 4])
    hold on; grid on; axis square
    
    T1 = trans(3,0);
    T2 = rot(pi/4);
    
    Q1 = T1*T2*P;
    Q2 = T2*T1*P;
    h1 = fill(Q1(1,:), Q1(2,:),'r'); %1º rotação, 2º translação
    h2 = fill(Q2(1,:), Q2(2,:),'g'); %1º translação, 2º rotação
    
    text(mean(P(1,:)), mean(P(2,:)), 'P');
    text(mean(Q1(1,:)), mean(Q1(2,:)), 'Q1');
    text(mean(Q2(1,:)), mean(Q2(2,:)), 'Q2');
      
end

%% Ex4b -------------------------------------------------------------------
exercise = 'Ex4b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    clc
    close all
    
    P = [-0.5 0.5 0; 0 0 2; 1 1 1];
    h = fill(P(1,:), P(2,:),'y');
    axis([-4 4 -4+3 4+3])
    hold on; grid on; axis square
    
    
    for t = linspace(0,3,20) % 20 valores de 0 a 3
        Q = trans(0,t)*P;
        set(h,'Xdata', Q(1,:), 'Ydata', Q(2,:));
        pause(0.05);
    end
      
end

%% Ex4c -------------------------------------------------------------------
exercise = 'Ex4c'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    clc
    close all
    
    P = [-0.5 0.5 0; 0 0 2];
    % P = [-0.5 0.5 0 -0.5; 0 0 2 0];

    % homogeneização das coordenadas
    P = [P; ones(1, size(P,2))];

    h1 = fill(P(1,:), P(2,:),'y');
    axis([-12 2 -2 12])
    hold on; grid on; axis square

    N = 50;
    
    % (Part 1)
    for t = linspace(0,3,N) % 20 valores de 0 a 3
        Q = trans(0,t)*P;
        set(h1,'Xdata', Q(1,:), 'Ydata', Q(2,:));
        pause(0.05);
    end
    
    % (Part 2)
    for a = linspace(0,pi/2,N)
        Q = rot(a)*trans(0,3)*P;
        set( h1, 'XData', Q(1,:), 'YData', Q(2,:));
        pause(0.05)
    end
    
    % (Part 3)
    for t = linspace(0,-6,N)
        Q = trans(t,0)*rot(pi/2)*trans(0,3)*P;
        set( h1, 'XData', Q(1,:), 'YData', Q(2,:));
        pause(0.05)
    end
    
    % (Part 4)
    for a = linspace(0,-pi/2,N)
        Q = trans(-6,0)*rot(pi/2)*trans(0,3)*rot(a)*P;
        set( h1, 'XData', Q(1,:), 'YData', Q(2,:));
        pause(0.05)
    end
      
end

%% Ex5 -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    close all
    clc
    
    % Define as coordenadas dos vértices do cubo e as faces que conectam esses vértices
    V = [1 1 0; -1 1 0; -1 -1 0; 1 -1 0; 1 1 2; -1 1 2; -1 -1 2; 1 -1 2];
    F = [1 2 3 4; 5 6 7 8; 1 2 6 5; 1 5 8 4; 3 7 8 4; 2 6 7 3];
    

    h = patch('Vertices', V, 'Faces',F,'Facecolor','c');
    grid on
    axis([-2 2 -2 2])
    axis equal
    view(3) % para vizualizar a 3d

    N = 20;
    for a=linspace(0,20*pi,N)
      Q = V*rot(a);
      cla
      patch('Vertices', Q, 'Faces',F,'Facecolor','c');
      pause(0.05)
    end
    
    
end




%% Ex6 -------------------------------------------------------------------

exercise = 'Ex6'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
    disp(['Executing ' exercise ':'])
    clearvars -except list_of_exercises % Delete all previously declared vars

    close all
   
    
    % Definir manualmente um polígono arbitrário com o comando  ginput’ do Matlab
    prompt = "Número de vértices para o polígno: "; % pergunta ao utilizador quantos vértices
    n = input(prompt);
    axis([-5 5 -5 5]);
    grid on;
    [x, y] = ginput(n);
    
    x_line = zeros(1,n+1); y_line = x_line;
    x_line(1:n) = x; x_line(n+1) = x(1);
    y_line(1:n) = y; y_line(n+1) = y(1);
    figure(1)
    hold on
    plot(x_line,y_line,'bo-', 'LineWidth',2)
    

    % Guardar as coordenadas numa nova matriz (homogenizada)
    Coords_Pol = zeros(3, n);
    for cc = 1:n
        Coords_Pol(1,cc) = x(cc);
        Coords_Pol(2,cc) = y(cc);
        Coords_Pol(3,cc) = 1;
    end
 
    % Definiões do plot
    pol = fill(x, y, 'y');
    grid on;
    axis([-30 25 -30 25]);
    axis square;

    % (Part 1)
    translacao1 = linspace(0, 3, 20);
    % (Part 2)
    rotacao1 = linspace(0, pi/2, 20);
    % (Part 3)
    translacao2 = linspace(0, -6, 20);
    % (Part 4)
    rotacao2 = linspace(0, -pi/2, 20);

    % Scale - Part 1
    escala = linspace(1, 2, 20);
    escala_count = 1;

    % (Part 1)
    for t1 = translacao1
        trans1 = trans_scale(0, t1, escala(escala_count));
        escala_count = escala_count + 1;
        Operacao1 = trans1 * Coords_Pol;
        set(pol, 'XData', Operacao1(1,:), 'YData', Operacao1(2,:));
        hold on;
        pause(0.05);
        grid on;
        axis([-30 25 -30 25]);
        axis square;
    end
    

    escala_count = 1;

    % (Part 2)
    for r1 = rotacao1
        rot1 = rot_scale(r1,1/escala(escala_count));
        escala_count = escala_count + 1;
        Operacao2 = rot1 * Operacao1;
        set(pol, 'XData', Operacao2(1,:), 'YData', Operacao2(2,:));
        hold on;
        pause(0.05);
        grid on;
        axis([-30 25 -30 25]);
        axis square;
    end
    
    rotacao_propria = linspace(0, 2*pi, 20);
    rot_counter = 1;

    % (Part 3)
    for t2 = translacao2
        ang = rotacao_propria(1,rot_counter);
        r_p = rot(ang);
        rot_counter = rot_counter + 1;
        trans2 = trans(t2, 0);
        Operacao3 = trans2 * (Operacao2/Coords_Pol) * r_p * Coords_Pol;
        set(pol, 'XData', Operacao3(1,:), 'YData', Operacao3(2,:));
        hold on;
        pause(0.05);
        grid on;
        axis([-30 25 -30 25]);
        axis square;
    end
    
    % Definir cor e color map
    cor_counter = 20;
    cm = parula(20);

    % (Part 4)
    for r2 = rotacao2
        rot2 = rot(r2);
        Operacao4 = (Operacao3/Coords_Pol) * rot2 * Coords_Pol;
        set(pol, 'XData', Operacao4(1,:), 'YData', Operacao4(2,:),'FaceColor', cm(cor_counter,:));
        cor_counter = cor_counter - 1;
        hold on;
        pause(0.05);
        grid on;
        axis([-30 25 -30 25]);
        axis square;
    end

end


