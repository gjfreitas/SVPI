function P = genpts(A, B, n)
    % Dados dois pontos (a 3D) gera um conjunto de n pontos uniformemente espaçados entre esses dois pontos extremos.
    
    % Calcula o vetor de direção entre A e B
    v = B - A;
    
    % Gera os pontos uniformemente espaçados
    s = linspace(0, 1, n);
    P = A + v * s;

    %P = P';
end
