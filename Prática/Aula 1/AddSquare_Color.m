function X = AddSquare_Color(I, line, col, size, color)
    I(line:line+size, col:col+size) = color;
    X = I;
end