function mesh = plane(x, y, col, row, scale)

% Establecer limites del plano
xMin = x;
xMax = x + col*scale;
yMin = y;
yMax = y + row*scale;

% Generar meshgrid a partir de los limitess
mesh = genMeshgrid(xMin, xMax, col, yMin, yMax, row);

end