function pixelC = pixelCoord(width, height)
% Pixels in coordenadas homogeneas
%
%  Salida:
%   Coordeanadas de los pixeles: [3, w*h]

    x = linspace(0, width-1, width);
    y = linspace(0, height-1, height);
    [x, y] = meshgrid(x, y);

    xr = reshape(x.', 1, []);
    yr = reshape(y.', 1, []);
    
    pixelC = [xr; yr; ones(size(xr))];

end