function X = AddSquare(I, line, col)
    I(line:line+10-1, col:col+10-1) = 1;
    X = I;
end