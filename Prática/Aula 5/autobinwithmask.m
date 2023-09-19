function B = autobinwithmask(A, M)
    % Aplica a máscara na imagem original
    A_masked = A(M);
    
    % Calcula o limiar de Otsu na região coberta pela máscara
    level = graythresh(A_masked);
    
    % Binariza a região coberta pela máscara
    B_masked = imbinarize(A_masked, level);
    
    % Cria a imagem binarizada com a mesma dimensão da imagem original
    B = false(size(A));
    
    % Copia a região binarizada para a imagem final
    B(M) = B_masked;
    
end
