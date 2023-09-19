function [cR, cG, cB, x] = rgbhist(A)
    % Converter a imagem para o formato RGB, se necessário
    if size(A, 3) == 1
        A = repmat(A, [1, 1, 3]);
    end
    
    % Separar os canais R, G e B
    R = A(:,:,1);
    G = A(:,:,2);
    B = A(:,:,3);
    
    % Calcular os histogramas de cada canal
    [cR, xR] = imhist(R);
    [cG, xG] = imhist(G);
    [cB, xB] = imhist(B);
    
    % Criar vetor de intensidades
    x = 0:255; % Faixa de intensidades
    x = x./255; % para ficar entre 0 e 1
    
%     figure;
%     subplot(3, 1, 1);
%     bar(xR, cR, 'r');
%     title('Histograma do canal R');
%     xlim([0, 255]);
%     
%     subplot(3, 1, 2);
%     bar(xG, cG, 'g');
%     title('Histograma do canal G');
%     xlim([0, 255]);
%     
%     subplot(3, 1, 3);
%     bar(xB, cB, 'b');
%     title('Histograma do canal B');
%     xlim([0, 255]);
end
