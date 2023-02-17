function pixelCoords = perspective(camCoords, projMat, h, w)

eps = 1e-7; % Parametro para evitar la division por 0 en la division

% Implementacion de ecuacion
pixelCoords = projMat*camCoords;
% Homogenizar coordenadas
pixelCoords = pixelCoords(1:2, :)./(pixelCoords(3,:)+eps);

% Reordenar coordenadas
pixelCoords = reshape(pixelCoords, 2, h, w);
pixelCoords = permute(pixelCoords, [2, 3, 1]);

end

