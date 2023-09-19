function bin_img = autobin(img)

    threshold = graythresh(img);
    bin_img = imbinarize(img, threshold);

    % Contar o número de pixels brancos e pretos na imagem binarizada
    num_white_pixels = sum(bin_img(:)); % branco tem valor 1 e preto valor 0 então basta somar os valores da imagem para ter o nº de pixels brancos
    num_black_pixels = numel(bin_img) - num_white_pixels;
    
    % inversão da imagem a devolver caso o número de pixels brancos seja maior do que o de pixels pretos
    if num_white_pixels > num_black_pixels
        bin_img = 1-bin_img;
    end

end

