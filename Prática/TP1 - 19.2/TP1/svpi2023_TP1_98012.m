function [nnnnnn,a1,a2,a3,a4,a5,a6,a7,a8] = svpi2023_TP1_98012()

% agr1 = 4, arg2 = 23
% Q2----------------------------------------------------------------
%     17    19     1
% 
% Q8----------------------------------------------------------------
%    403    18
% 
% Q1----------------------------------------------------------------
%    115    57   198    56   206
% 
% Q5----------------------------------------------------------------
%      3   107   153   532    82     4   101   263   450   120
% 
% Q4----------------------------------------------------------------
%     86   241    15    -5
% 
% Q7----------------------------------------------------------------
%      1     1     1     1     0     1     0     0     0     1     0     1     1     1     1     0     1
%      1     0     0     0     0     1     0     0     0     1     0     1     0     0     1     0     1
%      1     1     1     1     0     0     1     0     1     0     0     1     1     1     1     0     1
%      0     0     0     1     0     0     1     0     1     0     0     1     0     0     0     0     1
%      1     1     1     1     0     0     0     1     0     0     0     1     0     0     0     0     1
% 
% Q6----------------------------------------------------------------
%      6     7     5     9
% 
% Q3----------------------------------------------------------------
%      0     1     0
%      1     1     1
%      0     1     0


Img1 = im2double(imread('image_TP1_2023_1.png'));
Img2 = im2double(imread('image_TP1_2023_2.png'));
Img3 = im2double(imread('image_TP1_2023_3.png'));
Img4 = im2double(imread('image_TP1_2023_4.png'));
Img5 = im2double(imread('image_TP1_2023_5.png'));

Q3 = [0 1 0;1 1 1;0 1 0];

Q7 = [1     1     1     1     0     1     0     0     0     1     0     1     1     1     1     0     1
      1     0     0     0     0     1     0     0     0     1     0     1     0     0     1     0     1
      1     1     1     1     0     0     1     0     1     0     0     1     1     1     1     0     1
      0     0     0     1     0     0     1     0     1     0     0     1     0     0     0     0     1
      1     1     1     1     0     0     0     1     0     0     0     1     0     0     0     0     1];

%nnnnnn -- o num mec do aluno
nnnnnn=98012;

a1 = f1(115, 57, 198, 56, 206, Img1);

a2 = f2(17,19,1, Img1);

a3 = f3(Q3, Img2);

a4 = f4(86, 241, 15, -5, Img2);

a5 = f5(3, 107, 153, 532, 82, 4, 101, 263, 450, 120, Img3);

a6 = f6(6, 7, 5, 9, Img3);

a7 = f7(Q7, Img4);

a8 = f8(403, 18, Img5);



function count = f1(w,h1,h2,v1,v2,A)
% As faixas atravessam a imagem até aos seus bordos. NB. Pode acontecer 
% que alguma das faixas ultrapasse os limites direito ou inferior da 
% imagem: nesses casos, a região fora da imagem não será levada em conta. 
% As faixas paralelas nunca se sobrepõem entre si.

% como são apenas as faixas direita e inferior apenas o h2 e v2 podem
% passar, pelo q o if so precisa verificar esses casos

    if w+h2 >= size(A,1)
        limite_lin = size(A,1);
    else
        limite_lin = w+h2-1;
    end

    if w+v2 >= size(A,2)
        limite_col = size(A,2);
    else
        limite_col = w+v2-1;
    end

    
    h = zeros(size(A));
    v = zeros(size(A));
    
    % cria as faixas brancas com base nos limites
    h(h1:h1+w-1,:) = 1;
    h(h2:limite_lin,:) = 1;
    v(:,v1:v1+w-1) = 1;
    v(:,v2:limite_col) = 1;
    
    mask = and(h,v); % junção das 4 faixas (ideia - xor aula 5)
    
    count = sum(sum(A(mask)));
end

function count = f2(nrows, ncols, nwhites,img)
    F = ones(nrows, ncols); % filtro de 1's -> pois - 1*preto = 0 e 1*branco = 1

    X = filter2(F,img); % aplicar o filtro

    count = 0;
    for i=1:size(X,1)
        for j=1:size(X,2)
            if( X(i,j) <= nwhites && img(i,j)==0 ) % se for menor que nwhites e se for um pixel preto
                count = count + 1;
            end
        end
    end

end

function count = f3(F,img)

    % Como não é especificado como se quer resolvido o exercicio pode-se
    % usar filtros (semelhante ao ex2) ou então proceder a contagem dos
    % pixeis 1 a 1 como de seguida

    [nrows, ncols] = size(F);
    
    % Adicionar zeros ao redor da imagem para considerar pixels fora da borda
    % Nota guião -> Se for necessário considerar pixels para além dos limites
    % das imagens a analisar, o valor desses pixels será zero (preto).

    im_padded = padarray(img, [(nrows-1)/2, (ncols-1)/2], 0);

    % Quando se fala em pixel central, nrows e ncols são sempre ímpar pelo
    % que pode-se usar sempre a linha acima representada sem necessidade de
    % usar uma condição if por exemplo para verificar se são pares ou impares
    
    count = 0;
    
    % Percorrer cada pixel da imagem original
    for r = 1:size(img,1)
        for c = 1:size(img,2)
            % Obter a submatriz de vizinhança N8 centrada no pixel atual
            subim = im_padded(r:r+nrows-1, c:c+ncols-1);
    
            if subim == F % se a vizinhança esta de acordo com o pretendido
                % Incrementar a contagem
                count = count + 1;
            end
        end
    end

end

function count = f4(L,x,y,ang,A)

    S = true(L); % quadrado (branco) de lados L

    % ideia - aula 3
    
    [lins,cols]=size(A); % size da imagem
    T = trans(x,y)*rot(ang); % rotação em torno do canto superior esquerdo
    T = T*trans(-1,-1); % devido à indexação translaciona-se para baixo e para esquerda para ficar no ponto certo
    Ri = affine2d(T'); % dimensões e coordenadas dos limites da imagem de entrada 
    Ro = imref2d([lins cols]); % dimensões da imagem de saida
    temp = imwarp(S,Ri,'OutputView',Ro,'SmoothEdges',true,'interp','nearest');
    
    F = [-1 -1 -1; -1 -8 -1; -1 -1 -1]; % filtro para pontos não isolados
    X = filter2(F,A); % aplicar o filtro à imagem    
    
    % Como queremos o número de pontos não isolados e branco = 1 e preto =
    % 0, basta ver quantos pontos, na zona de interesse, tem valor < que -8
    count = sum(sum(X(temp)<-8));

end


function count = f5(cp1, ri1, re1, x01, y01, cp2, ri2, re2, x02, y02, A)
    % verificar qual o tipo da coroa 1
    if cp1 == 1
        h = desenho1(ri1, re1, x01, y01,A);
    elseif cp1 == 2
        h = desenho2(ri1, re1, x01, y01,A);
    elseif cp1 == 3
        h = desenho3(ri1, re1, x01, y01,A);
    elseif cp1 == 4
        h = desenho4(ri1, re1, x01, y01,A);
    end

    % verificar qual o tipo da coroa 2
    if cp2 == 1
        v = desenho1(ri2, re2, x02, y02,A);
    elseif cp2 == 2
        v = desenho2(ri2, re2, x02, y02,A);
    elseif cp2 == 3
        v = desenho3(ri2, re2, x02, y02,A);
    elseif cp2 == 4
        v = desenho4(ri2, re2, x02, y02,A);
    end

    mask = and(h,v); % vê a interseção (ideia - xor aula 5)
    count = sum(sum(A(mask))); 
    % como os pontos brancos valem 1 e os pretos 0
    % basta fazer a soma dos elementos da matriz para obter o número
    % de pontos brancos

end

function count = f6(N, L, med1, med2,img)

    % bordos a preto
    img([1:N-1,end-N+2:end],:) = 0;
    img(:,[1:N-1,end-N+2:end]) = 0;
    
    % filtro para pontos isolados - aula 4
    F = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    X = filter2(F, img); % aplicar o filtro
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            if X(i,j) == 8 || X(i,j) == -8 % pontos isolados: -8 -> ponto preto rodeado por brancos
                                           %                   8 -> ponto branco rodeado por pretos
               
               % Definção dos limites do quadrado de lado L

               % limite esquerdo linha
               if i <= (L-1)/2
                   lim_lin1 = i-1;
               else
                   lim_lin1 = (L-1)/2;
               end
    
               % limite direito linha
               if i + (L-1)/2 >= size(img,1)
                   lim_lin2 = size(img,1)-i-1;
               else
                   lim_lin2 = (L-1)/2;
               end
    
               % limite esquerdo coluna
               if j <= (L-1)/2
                   lim_col1 = j-1;
               else
                   lim_col1 = (L-1)/2;
               end
    
               % limite direito coluna
               if j + (L-1)/2 >= size(img,2)
                   lim_col2 = size(img,2)-j-1;
               else
                   lim_col2 = (L-1)/2;
               end
                
               % Cria o quadrado de lado L centrado no ponto isolado
               img(i-lim_lin1:i+lim_lin2, j-lim_col1:j+lim_col2) = 1;
            
            end
                
        end
    end
    
    img_med_old = img; % imagem antiga f(n)
    % img_med -> imagem apos mediana f(n+1)
    
    count = 1; % contador de tentativas
    while true
        img_med = medfilt2(img_med_old, [med1,med2]); % aplica o filtro de mediana de dimensões (med1,med2)
        if img_med == img_med_old % se for igual estabilizou
            break;
        end
        img_med_old = img_med; % senão continua-se 
        count = count + 1; % incrementa-se o contador
    end
end

function count = f7(filter,img)

    [nrows, ncols] = size(filter);
    im_padded = padarray(img, [nrows, ncols], 0); % aumenta a imagem com pixeis pretos nos bordos
    ip_copy = im_padded; % guarda uma copia

    nr = (nrows-1)/2;
    nc = (ncols-1)/2;
    count = 0;
    
    % filtro f2 é um filtro igual ao filter mas com mais 2 linhas e duas
    % colunas (exteriores) com valor 0.1
    % estes valores servem para obrigar a que cada padrão tenha uma
    % linha/coluna de intervalo entre o próximo padrão
    f2 = zeros(nrows+2,ncols+2);
    f2(2:end-1,2:end-1) = filter;
    
    f2(1,:) = 0.1;
    f2(end,:) = 0.1;
    f2(:,1) = 0.1;
    f2(:,end) = 0.1; 
    
    % f3 é igual ao filter só que o centro é 2 em vez de 1
    % isto deve-se ao facto que no for seguinte se vai somar então 1+1=2
    f3 = filter; f3((nrows+1)/2,(ncols+1)/2) = 2;
    
    for r=1:size(im_padded,1)
        for c=1:size(im_padded,2)
            if im_padded(r,c) == 1 % ve se o pixel é branco
                ip_copy(r-nr-1 : r+nr+1,c-nc-1:c+nc+1) = ip_copy(r-nr-1 : r+nr+1,c-nc-1:c+nc+1) + f2; % soma o filtro f2 a imagem
            end
        end
    end
    
    
    for r=1:size(ip_copy,1)
        for c=1:size(ip_copy,2)
            if ip_copy(r,c) == 2 % ve se o pixel é branco
                if ip_copy(r-nr : r+nr,c-nc:c+nc) == f3 % se for igual ao f3 quer dizer que se pode desenhar o padrão
                    count = count +1;
                end
            end
        end
    end

end

function count = f8(v,inc,img)
    
    minSize = v - inc; % tamanho minimo da aresta
    maxSize = v + inc; % tamanho máximo da aresta
    
    B = edge(img,'log'); % encontra as edges 
    % como as arestas de B podem não ter contornos fechados -> aplicar segunda ordem
    % opção log foi a escolhida porque foi a que obteve melhores resultados

    % ideia - aula 6
    [L,N] = bwlabel(B);
    
    count = 0;
    for k=1:N
        C = (L==k); % aresta
        tamanho = sum(sum(C)); % tamanho da aresta
        if (tamanho >= minSize && tamanho <= maxSize) % se esta dentro dos limites 
            count = count + 1; % incrementa-se o contador
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funções adicionais - ex 4

function R = rot(a)
    R = [cosd(a) -sind(a) 0 ; sind(a) cosd(a) 0; 0 0 1]; % angulo 'a' está em graus
end

function T = trans(vx,vy)
    T = [1 0 vx; 0 1 vy; 0 0 1];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funções adicionais - ex 5

function h = desenho1(ri,re,x0,y0,A)
    % coroa circular (circular fora e dentro)
    h = zeros(size(A));
    for i=1:size(A,2)
        for j=1:size(A,1)
            dist = (i-x0)^2+(j-y0)^2;
            if dist <= re^2 && dist >= ri^2
                h(j,i) = 1;
            end
        end
    end
end

function h = desenho2(ri,re,x0,y0,A)
    % quadrangular (quadrangular fora e dentro)
    h = zeros(size(A));

    if rem(ri,2) == 0
        dist_i = ri/2;
    else
        dist_i = floor((ri-1)/2);
    end
    
    if rem(re,2) == 0
        dist_e = re/2;
    else
        dist_e = floor((re-1)/2);
    end
    
    
    for i=1:size(A,2)
        for j=1:size(A,1)
            if ((i>= x0-dist_e && i<=x0-dist_i) || (i>= x0+dist_i && i<=x0+dist_e) || (j>= y0-dist_e && j<=y0-dist_i) || (j>= y0+dist_i && j<=y0+dist_e)) && ...
                (i>= x0-dist_e && i<= x0+dist_e) && (j>= y0-dist_e && j<= y0+dist_e)
                    h(j,i) = 1;
            end
    
        end
    end
end



function h = desenho3(ri,re,x0,y0,A)
    % circular pelo exterior e quadrangular pelo interior
    h = zeros(size(A));
    
    if rem(ri,2) == 0
        dist_i = ri/2;
    else
        dist_i = floor((ri-1)/2);
    end
    
    for i=1:size(A,2)
        for j=1:size(A,1)
            dist = (i-x0)^2+(j-y0)^2;
            if (i<=x0-dist_i || i>=x0+dist_i || j<=y0-dist_i || j>=y0+dist_i)
                if dist <= re^2
                    h(j,i) = 1;
                end
            end
        end
    end
end

function h = desenho4(ri,re,x0,y0,A)
    % quadrangular pelo exterior e circular pelo interior
    h = zeros(size(A));
    
    if rem(re,2) == 0
        dist_e = re/2;
    else
        dist_e = floor((re-1)/2);
    end
    
    for i=1:size(A,2)
        for j=1:size(A,1)
            dist = (i-x0)^2+(j-y0)^2;
            if dist >= ri^2
                if (i>=x0-dist_e && i<=x0+dist_e && j>=y0-dist_e && j<=y0+dist_e)
                    h(j,i) = 1;
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end