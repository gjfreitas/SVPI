%% TemplateCodeSVPI -------------------------------------------------------
% Name:       Gonçalo Freitas
% Num. Mec:   98012
% Date:       28/02/2023

%% Initial configurations
clc % Clear all text from command window
close all % Close all figures previously opened
clear % Clear previous environment variables
%addpath('../lib') % Update yout matlab path (the folder must exist)

list_of_exercises = { %Add, comment or uncomment at will
  'Ex1'
  'Ex2a'
  'Ex2b'
  'Ex2c'
  'Ex2d'
  'Ex3a'
  'Ex3b'
  'Ex4'
  'Ex5'
  }; %Defines the exercise to be executed (one or more at a time).


%% Ex1 -------------------------------------------------------------------

exercise = 'Ex1'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    
    A = im2double(imread('rice.png'));
    figure(1)
    imshow(A)
    
    a = pi/4;
    
    % Opcção 1 - imrotate()
    ang = -a*180/pi; % conversão para graus
    newZ2 = imrotate(A, ang);
    figure(2)
    imshow(newZ2)
    title('imrotate()')
    
    % Opção 2 - imwarp(), abordagem geral
    T = rot(a);
    tf = affine2d(T'); % matriz transformação
    % Nota: A função affine2d() usa a matriz de transformação na forma transposta.
    
    newZ1 = imwarp(A,tf);
    figure(3)
    imshow(newZ1)
    title('imwarp()')
  
  
end

%% Ex2a -------------------------------------------------------------------
exercise = 'Ex2a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  clearvars -except list_of_exercises exercise
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
 % add your code here ...
 close all

     A = im2double(imread('bolt1.png'));
    figure(1)
    imshow(A)
    
    %Para melhor visualizar o efeito, forçar um bordo branco na imagem original antes de aplicar a transformação. Como se pode fazer?
    A(:,end) = 1; A(end,:) = 1;
    A(:,1) = 1; A(1,:) = 1;
    
    cols = 600; lins = 400;
    
    x =  (lins/2) * rand;% x = 0;
    y =  (cols/2) * rand;% y = 0;
    a = pi/4;
    
    T = trans(x,y)*rot(a);
    
    tf = affine2d(T'); % matriz transformação
    
    Ro = imref2d([lins cols]);
    temp = imwarp(A,tf, 'OutputView',Ro,'SmoothEdges',true);
    
    figure(2)
    imshow(temp)
  
end

%% Ex2b -------------------------------------------------------------------

exercise = 'Ex2b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
  close all
  

    A = im2double(imread('bolt1.png'));

    %Para melhor visualizar o efeito, forçar um bordo branco na imagem original antes de aplicar a transformação. Como se pode fazer?
    % A = padarray(A, [1 1], 255, 'both');
    A(:,end) = 1; A(end,:) = 1;
    A(:,1) = 1; A(1,:) = 1;
    figure(1)
    imshow(A)
    
    cols = 600; lins = 400;
    
    x =  (lins/2) * rand;% x = 0;
    y =  (cols/2) * rand;% y = 0;
    a = pi/4;
    T = trans(x,y)*rot(a);
    
    tf = affine2d(T'); % matriz transformação
    
    
    Ro = imref2d([lins cols]);
    
    wObj=size(A,2); hObj=size(A,1);
    imxlim=[-wObj/2 wObj/2];
    imylim=[-hObj/2 hObj/2];
    Ri=imref2d(size(A),imxlim,imylim);
    B=imwarp(A, Ri, tf, 'OutputView',Ro,'SmoothEdges',true);
    
    figure(2)
    imshow(B)
    title('Com Ri')
    
    figure(3)
    B=imwarp(A, tf, 'OutputView',Ro,'SmoothEdges',true);
    imshow(B)
    title('Sem Ri')
    
    figure(4)
    B=imwarp(A, Ri,tf, 'OutputView',Ro,'SmoothEdges',true, 'Interp', 'nearest');
    imshow(B)
    title('Com Ri e Interp - nearest')

end

%% Ex2c -------------------------------------------------------------------
exercise = 'Ex2c'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
    close all


    A = im2double(imread('bolt1.png'));
    %Para melhor visualizar o efeito, forçar um bordo branco na imagem original antes de aplicar a transformação. Como se pode fazer?
    A(1,:)=1;A(end,:)=1;
    A(:,1)=1;A(:,end)=1;
    
    cols=600; lins = 400;
    
    tempA=zeros(lins,cols); tempB = tempA; tempC = tempA;
    
    Ro = imref2d([lins cols]);
    
    wObj=size(A,2);hObj=size(A,1);
    imxlim=[-wObj/2 wObj/2];
    imylim = [-hObj/2 hObj/2];
    Ri=imref2d(size(A),imxlim,imylim);
    
    for i=1:5
        x = cols+(-cols)*rand();y = lins+(-lins)*rand(); a = 2*pi+(-2*pi)*rand();
        T = trans(x,y)*rot(a);
        tf = affine2d(T');
    
        single = imwarp(A,Ri,tf,'OutputView',Ro,'SmoothEdges',true);
    
        tempA = tempA + single; % Da valores maiores que 1, na imagem uma sobreposição aparece com uma cor mais intensa
        
        tempB = max(tempB,single); % Da o maximo (so pode ser 1) então nao origina valores maiores que um, ou seja, nao faz a soma
        
        mask = (single>0);
        tempC(mask) = single(mask); % faz a substituição dos valores que eram diferentes de 0
    end
    figure(1)
    imshow(tempA)
    title('accumul = accumul + singleBolt')
    figure(2)
    imshow(tempB)
    title('max')
    figure(3)
    imshow(tempC)
    title('mask')
    
    % count = 0;
    % for i=1:size(tempA,1)
    %     for j=1:size(tempA,2)
    %         if tempA(i,j) > 0
    %             count = count +1;
    %         end
    %     end
    % end
    % 
    % disp(['Número de sobreposições de pixeis - ', num2str(count)])
  
end

%% Ex2d -------------------------------------------------------------------
exercise = 'Ex2d'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    
    A = im2double(imread('bolt1.png'));
    %Para melhor visualizar o efeito, forçar um bordo branco na imagem original antes de aplicar a transformação. Como se pode fazer?
%     A(1,:)=1;A(end,:)=1;
%     A(:,1)=1;A(:,end)=1;
    
    cols=600; lins = 400;
    
    tempA=zeros(lins,cols); 
    tempA(1,:)=1; tempA(end,:)=1; tempA(:,1)=1; tempA(:,end)=1; % para as imagens n sairam do bordo
    
    Ro = imref2d([lins cols]);
    
    wObj=size(A,2);hObj=size(A,1);
    imxlim=[-wObj/2 wObj/2];
    imylim = [-hObj/2 hObj/2];
    Ri=imref2d(size(A),imxlim,imylim);
    
    i = 0;
    while i~=20
        x = cols+(-cols)*rand();y = lins+(-lins)*rand(); a = 2*pi+(-2*pi)*rand();
        T = trans(x,y)*rot(a);
        tf = affine2d(T');
    
        single = imwarp(A,Ri,tf,'OutputView',Ro,'SmoothEdges',true);
        
        tempA = tempA + single;
        if any(tempA(:)>1)          % para n haver sobreposição
            tempA = tempA - single;
            i = i-1;
        end
        i = i+1;
    end
    
    figure(1)
    imshow(tempA)
    title(['accumul = accumul + singleBolt. Number of screws: ', num2str(i)])

end

%% Ex3a (Opcional)-------------------------------------------------------------------
exercise = 'Ex3a'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    
    figure(1)
    subplot(1,2,1)
    imshow(create_domino(2,6))
    title('Dominó Esperado')
    subplot(1,2,2)
    imshow(domino_func(2,6))
    title('Dominó Obtido')
    
    figure(2)
    subplot(1,2,1)
    imshow(create_domino(0,4))
    title('Dominó Esperado')
    subplot(1,2,2)
    imshow(domino_func(0,4))
    title('Dominó Obtido')
    
    figure(3)
    subplot(1,2,1)
    imshow(create_domino(3,3))
    title('Dominó Esperado')
    subplot(1,2,2)
    imshow(domino_func(3,3))
    title('Dominó Obtido')
end

%% Ex3b (Opcional)-------------------------------------------------------------------
exercise = 'Ex3b'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
  
    lins = 600; cols = 800;
    
    tempA=zeros(lins,cols); 
    tempA(1,:)=1; tempA(end,:)=1; tempA(:,1)=1; tempA(:,end)=1;
    
    A = create_domino(3,2);
    Ro = imref2d([lins cols]);
    
    wObj=size(A,2);hObj=size(A,1);
    imxlim=[-wObj/2 wObj/2];
    imylim = [-hObj/2 hObj/2];
    Ri=imref2d(size(A),imxlim,imylim);
    
    
    %Como se poderia fazer para garantir que não há dominós repetidos?
    N = 20;
    valores = nan(N,2);
    for g = 1:N
        bolas_direitas = floor((6 - 0) .* rand() + 0);
        bolas_esquerdas = floor((6 - 0) .* rand() + 0);
        for idx = 1:N
            while (valores(idx,1) == bolas_direitas && valores(idx,2) == bolas_esquerdas) || (valores(idx,1) == bolas_esquerdas && valores(idx,1) == bolas_direitas)
                    bolas_direitas = floor((6 - 0) .* rand() + 0);
                    bolas_esquerdas = floor((6 - 0) .* rand() + 0);
            end
        end
    valores(g,1) = bolas_direitas;
    valores(g,2) = bolas_esquerdas;
    end
    
    i = 0;
    while i~=N
        c = 0;
        domino = domino_func(valores(i+1,1), valores(i+1,2));
        
        while c ~= -1
            % Definir valores aleatórios para x e y
            x = (cols - 0) .* rand() + 0;
            y = (lins - 0) .* rand() + 0;
            % Definir um valor aleatorio para o angulo
            ang = (pi/4 - 0) .* rand() + 0;
            % Definir a tranformação total da imagens
            tranformation = trans(x, y) * rot(ang);
            % Aplicar a função 'affine2d()'
            tranformation_affine = affine2d(tranformation');
            % Aplicar a função warp()
            domino_final = imwarp(domino, Ri, tranformation_affine,'OutputView', Ro, 'SmoothEdges', true);
        
            tempA = tempA + domino_final; % Da valores maiores que 1, na imagem uma sobreposição aparece com uma cor mais intensa
            if any(tempA(:)>1)
                tempA = tempA - domino_final;
                i = i-1;
            end
            i = i+1;
            c = -1;
        end
    end

    figure(1)
    imshow(tempA);
    title('Exercício 3b')
  
end

%% Ex4  -------------------------------------------------------------------
exercise = 'Ex4'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all
    
    % Criar as funções trasn3, rotx, roty, rotz
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 1 - Criar a matriz para a imagem e o objeto circular
    
    % Define o tamanho da imagem
    imLins = 240;
    imCols = 320;
    
    A = zeros(imLins, imCols);
    
    % figure(1)
    % imshow(A);
    
    % Criação de um objeto no espaço a 3D
    t = linspace(0,2*pi,50);
    P = [ 5*cos(t); 5*sin(t); 30*ones(size(t))];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 2 - Homogeneizar as coordenadas do objeto e aplicar transformações
    % geométricas adequadas
    
    % Homogeneizar as coordenadas do objeto
    P = [P; ones(1,size(P,2))];
    
    % Transformações geométricas do objeto no espaço
    % Atenção à ordem e significado
    P = trans3(0,0,30)*rotx(0)*roty(0)*trans3(0,0,-30)*P;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 3 - Representação do objeto
    
    %Representar o objeto a 3D.
    figure(2)
    fill3(P(1,:),P(2,:),P(3,:),'m')
    %plot3(P(1,:),P(2,:),P(3,:),'.')
    hold on; grid on; axis equal
    axis([-5 5 -5 5 0 40])
    zlabel('Z'); xlabel('X'), ylabel('Y')
    line([0 0], [0 0], [0 50]) % eixo Z
    fill3([4 -4 -4 4], [-3 -3 3 3], [0 0 0 0], 'k');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 4 - Obter a matriz intrínseca da câmara criando a função PerspectiveTransform()
    
    % Definição da matriz intrinseca da camara
    alpha = [500 500];
    center = [size(A,2) size(A,1)]/2;
    K = PerspectiveTransform(alpha,center);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 5 - Aplicar a transformação de perspetiva e des-homogeneizar.
    
    % A transformação de perpestiva/Projeção
    Ch = K*P;
    
    % Convert homogenous to no-homogeneous
    C = round( Ch(1:2,:) ./ repmat(Ch(3,:),2,1) );
    
    C(2,:) = size(A,1) - C(2,:); % C já contém o resultado da projeção
    
    % Agora é preciso criar uma imagem onde essas coordenadas estarão com pixel visível
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 6 - Criação uma imagem onde essas coordenadas estarão com pixel visível.
    
    % Coordenadas devem ser > 0 e menores que os limites da imagem, sob risco de erros.
    OKs = ( C(2,:) > 0 & C(2,:) <= imLins); % Excluir de C os índices que estão para além dos limites
    
    disp(['Dimensões da variável OKs? ',num2str(length(OKs(:,1))),'x',num2str(length(OKs(1,:)))])
    
    % OKs is a linear array with Os and 1s. Can be used as indexers
    C2 = C(2,OKs);
    C1 = C(1, OKs);
    C = [C1; C2]; % C is now the set of coordinates with "white pixels"
    
    % C já só tem valores de coordenadas que estão dentro dos limites da imagem definida.
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 7 - Sintetizar a imagem projetada
    
    % O matlab obriga a linearizar as coordenadas porque, por exemplo A(C)=1 não funciona! 
    % Assim, a solução é converter as coordenadas x,y em índices lineares absolutos mediante a função sub2ind()
    idx = sub2ind(size(A), C(2,:), C(1,:));
    A(idx) = 1;
    
    figure(3)
    imshow(A)
  
end

%% Ex5 (Opcional) -------------------------------------------------------------------
exercise = 'Ex5'; % Define the name of the current exercise
if ismember(exercise, list_of_exercises) %... if exer. in list_of_exercises
  disp(['Executing ' exercise ':'])
  clearvars -except list_of_exercises % Delete all previously declared vars
  
  % add your code here ...
    close all

    
    % Define o tamanho da imagem
    imLins = 240;
    imCols = 320;
    
    A = zeros(imLins, imCols);
    
    % figure(1)
    % imshow(A);
     
    % Criação de um objeto no espaço a 3D - USANDO A FUNÇÃO genpts
    t = 4;
    V1 =[0 0 0]';
    V2 =[3 6 12]';
    
    load P
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 2 - Homogeneizar as coordenadas do objeto e aplicar transformações
    % geométricas adequadas
    
    % Homogeneizar as coordenadas do objeto
    P = [P; ones(1,size(P,2))];
    
    % Transformações geométricas do objeto no espaço
    % Atenção à ordem e significado
    P = trans3(0,0,30)*rotx(pi/3)*roty(0)*trans3(0,0,-30)*P;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 3 - Representação do objeto
    
    %Representar o objeto a 3D.
    figure(2)
    fill3(P(1,:),P(2,:),P(3,:),'m')
    %plot3(P(1,:),P(2,:),P(3,:),'.')
    hold on; grid on; axis equal
    axis([-5 5 -5 5 0 40])
    zlabel('Z'); xlabel('X'), ylabel('Y')
    line([0 0], [0 0], [0 50]) % eixo Z
    fill3([4 -4 -4 4], [-3 -3 3 3], [0 0 0 0], 'k');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 4 - Obter a matriz intrínseca da câmara criando a função PerspectiveTransform()
    
    % Definição da matriz intrinseca da camara
    alpha = [500 500];
    center = [size(A,2) size(A,1)]/2;
    K = PerspectiveTransform(alpha,center);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 5 - Aplicar a transformação de perspetiva e des-homogeneizar.
    
    % A transformação de perpestiva/Projeção
    Ch = K*P;
    
    % Convert homogenous to no-homogeneous
    C = round( Ch(1:2,:) ./ repmat(Ch(3,:),2,1) );
    
    C(2,:) = size(A,1) - C(2,:); % C já contém o resultado da projeção
    
    % Agora é preciso criar uma imagem onde essas coordenadas estarão com pixel visível
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 6 - Criação uma imagem onde essas coordenadas estarão com pixel visível.
    
    % Coordenadas devem ser > 0 e menores que os limites da imagem, sob risco de erros.
    OKs = ( C(2,:) > 0 & C(2,:) <= imLins); % Excluir de C os índices que estão para além dos limites
    
    disp(['Dimensões da variável OKs? ',num2str(length(OKs(:,1))),'x',num2str(length(OKs(1,:)))])
    
    % OKs is a linear array with Os and 1s. Can be used as indexers
    C2 = C(2,OKs);
    C1 = C(1, OKs);
    C = [C1; C2]; % C is now the set of coordinates with "white pixels"
    
    % C já só tem valores de coordenadas que estão dentro dos limites da imagem definida.
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PASSO 7 - Sintetizar a imagem projetada
    
    % O matlab obriga a linearizar as coordenadas porque, por exemplo A(C)=1 não funciona! 
    % Assim, a solução é converter as coordenadas x,y em índices lineares absolutos mediante a função sub2ind()
    idx = sub2ind(size(A), C(2,:), C(1,:));
    A(idx) = 1;
    
    figure(3)
    imshow(A)
    title('Seta com rotx(pi/3)')

  
end
