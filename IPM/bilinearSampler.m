function output = bilinearSampler(imgs, pCoords)

% Obtener tamano de las imagenes
imgH = size(imgs,1); imgW = size(imgs,2); imgC = size(imgs,3);
pixH = size(pCoords,1); pixW = size(pCoords,2); pixC = size(pCoords,3);

% Obtner pixeles en X y Y
pixX = reshape(pCoords(:,:,1), pixH, pixW, 1);
pixY = reshape(pCoords(:,:,2), pixH, pixW, 1);

% Redondear valores
pixX0 = floor(pixX);
pixX1 = pixX0 + 1;
pixY0 = floor(pixY);
pixY1 = pixY0 + 1;

% Valores maximos en X y Y
yMax = imgH - 1; xMax = imgW - 1;

% Limitar valores
pixX0(pixX0<0) = 0; pixX0(xMax<pixX0) = xMax;
pixY0(pixY0<0) = 0; pixY0(yMax<pixY0) = yMax;
pixX1(pixX1<0) = 0; pixX1(xMax<pixX1) = xMax;
pixY1(pixY1<0) = 0; pixY1(yMax<pixY1) = yMax;

% distancia intermedia
wtX0 = pixX1 - pixX;
wtX1 = pixX - pixX0;
wtY0 = pixY1 - pixY;
wtY1 = pixY - pixY0;

baseY0 = pixY0*imgW;
baseY1 = pixY1*imgW;

% Indices
idx00 = pixX0 + baseY0;
idx00 = reshape(idx00.', 1, []);
idx01 = pixX0 + baseY1;
idx01 = reshape(idx01.', 1, []);
idx10 = pixX1 + baseY0;
idx10 = reshape(idx10.', 1, []);
idx11 = pixX1 + baseY1;
idx11 = reshape(idx11.', 1, []);

% Imagen inicial transformada
imgsT = zeros(size(imgs,2), size(imgs,1),size(imgs,3));
imgsT(:,:,1) = imgs(:,:,1).';
imgsT(:,:,2) = imgs(:,:,2).';
imgsT(:,:,3) = imgs(:,:,3).';

% reordenamiento
imgs_flat = reshape(imgsT, [], imgC);
im00 = reshape(imgs_flat(idx00+1,:), pixH, pixW, imgC);
im01 = reshape(imgs_flat(idx01+1,:), pixH, pixW, imgC);
im10 = reshape(imgs_flat(idx10+1,:), pixH, pixW, imgC);
im11 = reshape(imgs_flat(idx11+1,:), pixH, pixW, imgC);

w00 = wtX0.*wtY0;
w01 = wtX0.*wtY1;
w10 = wtX1.*wtY0;
w11 = wtX1.*wtY1;

% Remuestreo
output = w00.'.*im00 + w01.'.*im01 + w10.'.*im10 + w11.'.*im11;
output = uint8(output);
end