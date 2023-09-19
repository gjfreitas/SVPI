function M = circularROI(x0, y0, ri, re, A)
    [rows, cols] = size(A);
    [x, y] = meshgrid(1:cols, 1:rows);
    dist = sqrt((x - x0).^2 + (y - y0).^2);
    M = dist >= ri & dist <= re;
end
