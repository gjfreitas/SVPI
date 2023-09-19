function B = MultiRegionBin(A, N, M)
    % Divide a imagem A em N linhas e M colunas de regiões similares
    % e binariza cada região separadamente, retornando a imagem binarizada B
    % A função também representa a imagem original e a imagem binarizada lado a
    % lado bem como as linhas que separam as regiões
    
    % Determina o tamanho da imagem e o tamanho das regiões
    [height, width] = size(A);
    region_height = floor(height/N);
    region_width = floor(width/M);
    
    % inicializa a imagem binarizada
    B = zeros(height, width);
    
    % percorre cada região e binariza separadamente
    for i = 1:N
        for j = 1:M
            % determina as coordenadas iniciais e finais da região
            row_start = (i-1) * region_height + 1;
            row_end = i * region_height;
            col_start = (j-1) * region_width + 1;
            col_end = j * region_width;
            
            % verifica se estamos na primeira ou última região da linha/coluna
            if i == 1
                row_start = 1;
            elseif i == N
                row_end = height;
            end
            if j == 1
                col_start = 1;
            elseif j == M
                col_end = width;
            end
            
            % binariza a região atual usando Otsu
            region = A(row_start:row_end, col_start:col_end);
            threshold = graythresh(region);
            region_bin = imbinarize(region, threshold);
            
            % adiciona a região binarizada na imagem binarizada final
            B(row_start:row_end, col_start:col_end) = region_bin;
        end
    end
    
    % Representação
    figure;
    subplot(1,2,1);
    imshow(A);
    title('Imagem Original');
    hold on;
    
    % Desenhar as linhas
    for i = 1:N-1
        y = i * region_height;
        line([1 width], [y y], 'Color', 'r', 'LineWidth', 2);
    end
    for j = 1:M-1
        x = j * region_width;
        line([x x], [1 height], 'Color', 'r', 'LineWidth', 2);
    end
    
    subplot(1,2,2);
    imshow(B);
    title('Imagem Binarizada');
    hold off;

end
