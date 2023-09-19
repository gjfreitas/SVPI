function domino = domino_func(bolas_esquerda, bolas_direita)
    
    % Definir a matrix que armazena o dominó
    domino = ones(50, 101);
    % Meter a peça toda a cinzento
    domino = domino .* 0.25;
    % Meter bordo branco
    % Borda na parte superiror
    domino(1:1, :) = 1;
    % Borda na parte de baixo
    domino(50:50, :) = 1;
    % Borda Esquerda
    domino(:, 1:1) = 1;
    % Borda Direita
    domino(:, 101:101) = 1;
    % Definir a barra do meio
    domino(4:end-3, 50:51) = 1;

    if (bolas_esquerda > 6 || bolas_esquerda < 0 || floor(bolas_esquerda) ~= bolas_esquerda)

        error('Número de pintas do lado esquerdo inválido!')

    else
        
        % Condições bolas do lados esquerdo
        if(bolas_esquerda == 1)
            
            domino = AddCircle(domino, 25, 25, 5);
            
        elseif(bolas_esquerda == 2)
    
            domino = AddCircle(domino, 10, 10, 5);
            domino = AddCircle(domino, 40, 40, 5);
    
        elseif(bolas_esquerda == 3)
    
            domino = AddCircle(domino, 10, 10, 5);
            domino = AddCircle(domino, 25, 25, 5);
            domino = AddCircle(domino, 40, 40, 5);
    
        elseif(bolas_esquerda == 4)
    
            domino = AddCircle(domino, 10, 10, 5);
            domino = AddCircle(domino, 10, 40, 5);
            domino = AddCircle(domino, 40, 10, 5);
            domino = AddCircle(domino, 40, 40, 5);
    
        elseif(bolas_esquerda == 5)
    
            domino = AddCircle(domino, 10, 10, 5);
            domino = AddCircle(domino, 10, 40, 5);
            domino = AddCircle(domino, 25, 25, 5);
            domino = AddCircle(domino, 40, 10, 5);
            domino = AddCircle(domino, 40, 40, 5);
    
        elseif(bolas_esquerda == 6)
            
            domino = AddCircle(domino, 10, 10, 5);
            domino = AddCircle(domino, 10, 40, 5);
            domino = AddCircle(domino, 40, 10, 5);
            domino = AddCircle(domino, 40, 40, 5);
            domino = AddCircle(domino, 25, 10, 5);
            domino = AddCircle(domino, 25, 40, 5);
    
            else
    
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (bolas_direita > 6 || bolas_direita < 0 || floor(bolas_direita) ~= bolas_direita)

        error('Número de pintas do lado direito inválido!')

    else
        
        % Condições bolas do lados direito
        if(bolas_direita == 1)
          
            domino = AddCircle(domino, 75, 25, 5);

        elseif(bolas_direita == 2)
    
            domino = AddCircle(domino, 60, 10, 5);
            domino = AddCircle(domino, 90, 40, 5);
    
        elseif(bolas_direita == 3)
    
            domino = AddCircle(domino, 60, 10, 5);
            domino = AddCircle(domino, 75, 25, 5);
            domino = AddCircle(domino, 90, 40, 5);
    
        elseif(bolas_direita == 4)
    
            domino = AddCircle(domino, 60, 10, 5);
            domino = AddCircle(domino, 90, 10, 5);
            domino = AddCircle(domino, 60, 40, 5);
            domino = AddCircle(domino, 90, 40, 5);
    
        elseif(bolas_direita == 5)
    
            domino = AddCircle(domino, 60, 10, 5);
            domino = AddCircle(domino, 90, 10, 5);
            domino = AddCircle(domino, 75, 25, 5);
            domino = AddCircle(domino, 60, 40, 5);
            domino = AddCircle(domino, 90, 40, 5);
    
        elseif(bolas_direita == 6)
            
            domino = AddCircle(domino, 60, 10, 5);
            domino = AddCircle(domino, 75, 10, 5);
            domino = AddCircle(domino, 90, 10, 5);
            domino = AddCircle(domino, 60, 40, 5);
            domino = AddCircle(domino, 75, 40, 5);
            domino = AddCircle(domino, 90, 40, 5);
    
            else
    
        end
    end



    