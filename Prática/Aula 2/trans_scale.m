%% Função para devolver uma matriz de traslação dados vx e vy e escala scl
function Trans_Matrix = trans_scale(vx, vy, scl)

    Trans_Matrix = [scl 0 vx; 0 scl vy; 0 0 scl];
end