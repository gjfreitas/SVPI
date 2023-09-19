function I = AddHeart(Z, x0, y0, factor)
  x = 1:size(Z,2);
  x = x;
  y = 1:size(Z,1);
  y = y;
  [X,Y] = meshgrid(x,y);
  X = X/factor;
  Y = Y/factor;
  C = ( ( ((X-x0).^2 + (Y-y0).^2 - 1).^3 - (X-x0).^2 .*(Y-y0).^3 ) <= 0); 
  I = Z;
  I(C) = 1;
end