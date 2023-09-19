%% Função para devolver uma matriz de rotação dado um ângulo e escala
function Rot_Matrix = rot_scale(angulo, scl)

    Rot_Matrix = [scl * cos(angulo) -sin(angulo) 0; sin(angulo) scl * cos(angulo)  0; 0 0 scl];
end