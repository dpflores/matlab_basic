function coords = genMeshgrid(xMin, xMax, numX, yMin, yMax, numY)

% Generar mesh grid
x = linspace(xMin, xMax, numX);
y = linspace(yMin, yMax, numY);
[x, y] = meshgrid(x, y);

% Reordenar las matrices como filas
x = reshape(x.', 1, []);
y = reshape(y.', 1, []);
z = zeros(size(x));

% matriz homogenea
coords = [x; y; z; ones(size(x))];

end

