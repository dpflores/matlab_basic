%% Visualizar imagen RGB
frontImage = imread('./images/frontImage.png');

figure,
subplot(121),
imshow(frontImage)
title('Imagen RGB')

%% Definir plano de accion
TARGET_H= 500; TARGET_W = 500;
planoXYZ = plane(0, -25, TARGET_H, TARGET_W, 0.1);
planoXYZ(2,:) = -planoXYZ(2,:);

%% Parametros de la camara
K = [2263.55, 0, 1079.02,  0;
     0, 2250.37,  515.01,  0;
     0,       0,       1,  0;
     0,       0,       0,  1];
 
Rt = [-0.0097, -0.9999,       0,  0.0427;
      -0.0384,  0.0004, -0.9993,  1.2768;
       0.9992, -0.0097, -0.0384, -1.6518;
            0,       0,       0,       1];

%% Obtención de coordenadas de IPM
P = K*Rt;
pixelCoords = perspective(planoXYZ, P, TARGET_H, TARGET_W);

%% Interpolar la imagen para una correcta visualizacion
image2 = bilinearSampler(frontImage, pixelCoords);

%% Visualización de resultados
subplot(122),
imshow(image2)
title('Bird`s eye of view')