%% Visualize rgb
imageRGB = imread('./images/rgb.png');
figure,
subplot(121),
imshow(imageRGB);
title('Imagen RGB');

%% Visualize depth
load('depthDatamat.mat')
%[imDepth, alpha] = exrread("./images/depth.exr");
visualizeDepth = tonemap(imDepth);

subplot(122),
imshow(visualizeDepth);
title('Información de profundidad');

%% IPM
height = size(imageRGB, 1);
width = size(imageRGB, 2);

% Matriz de parámetros intrínsecos de la cámara
K = [[512,   0, 512, 0];
     [0  , 512, 384, 0];
     [0	 ,   0,	  1, 0];
     [0  ,	 0,	  0, 1]];
K_inv = inv(K);

% Cálculo de coordenadas de pixeles
pixelCoords = pixelCoord(width, height);

% Implementación de ecuación (1)
camCoords = K_inv(1:3,1:3)*pixelCoords.*reshape(imDepth.', 1, []);

% Limitar los puntos hasta 150m en la dirección de profundidad (para
% propósitos de visualización)
camCoordsFiltered = camCoords(:, find(camCoords(3, :)<=150).');

% Elaborar figura 3D
figure,
scatter3(camCoordsFiltered(1,:), camCoordsFiltered(3,:), -camCoordsFiltered(2,:), 0.1, camCoordsFiltered(3,:))
title('Reconstrucción 3D');
colormap(gca,"jet");
colorbar;
axis off

% Vista superior (figura 2d)
be = projectTopView(camCoordsFiltered);


