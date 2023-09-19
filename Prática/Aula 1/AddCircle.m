function I = AddCircle(Z, x0, y0, r)
  x = 1:size(Z,2);
  y = 1:size(Z,1);
  [X,Y] = meshgrid(x,y);
  C = (((X-x0).^2 + (Y-y0).^2) <= r*r);
  I = Z;
  I(C) = 1;
end