function  bird_eye = projectTopView(camCoords)

max_longitudinal = 70;
window_x = [-50, 50];
window_y = [-3, max_longitudinal];

y = camCoords(2,:);
z = camCoords(3,:);

% Reflejar el eje y a positivo hacia arriba
y = -y;

% Muestreamos para puntos a menos de 70m por delante y por encima del suelo
% De acuerdo con CARLA, la cámara está montada 1m por encima en un vehículo ego
ind = find(z < max_longitudinal & -1.2 < y);
bird_eye = camCoords(1:3, ind);

% Crear gamma de colores en base a la distancia radial
dists = sqrt(sum(bird_eye(1:2,:).^2,1));
axes_limit = 10;
colors = min(1,dists/axes_limit/sqrt(2));
size(colors)

% Elaborar figura (vista superior)
figure,
scatter(bird_eye(1,:), bird_eye(3,:), 0.1, colors);
colormap jet;
colorbar;
title('Vista superior');
xlim(window_x); ylim(window_y);
axis off

end