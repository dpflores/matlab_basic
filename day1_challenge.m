%% Rotación de una figura
clear all, close all, clc
% A continuación aplicaremos los conocimientos obtenidos con respecto a
% matrices de rotación y la composición de estas

%% Primero cargamos la data que obtenemos
% el siguiente comando cargará el archivo con las variables para este
% ejercicio

load("kon_points.mat")

% Observarán que en la parte derecha tenemos 1035 puntos tanto para x y z
% De momento solo concentrémonos en x e y.

%% Graficando los puntos
close all
% Para graficar los puntos en 2D, solo necesitamos los valores x e y

figure
plot(x,y, '.', 'markersize', 10)
xlim([-50 50])
ylim([-50 50])
xlabel('Eje x')
ylabel('Eje y')

% Como pueden ver, se muestra una figura del logo de KON con una
% orientación incorrecta, el objetivo es que ustedes roten todos los puntos
% utilizando la matriz de rotación correcta

%% Creando la matriz de rotación
% Recomendamos guíarse de la diapositiva 13 de la presentación para
% construir la matriz de rotación, ten en cuenta con respecto a que eje
% rotarás los puntos y el ángulo que necesitas

R = [];

%% Rotando todos los puntos
% En esta sección debes poder armar el vector de los puntos [x; y; z] y luego
% multiplicarlo por la matriz de rotación. Ten en cuenta que no solo es 1
% punto así que busca la forma óptima de realizarlo. Revisar diapositiva 14


% Una vez que hayas realizado la rotación, guarda los nuevos puntos en las
% siguientes variables
x2 = 
y2 = 
z2 =

%% Graficando la rotación 
% Ahora solo graficamos y verificamos la correcta rotación de los puntos.

figure
plot(x2,y2, '.', 'markersize', 10)
xlim([-50 50])
ylim([-50 50])
xlabel('Eje x')
ylabel('Eje y')

% Si lo has logrado, podrías intentar ahora hacer una composición de
% rotaciones, trata de que la figura original esté boca abajo utilizando 2
% rotaciones contiguas. 

%% 3D

% Tengamos en cuenta que tenemos puntos en 3 ejes, es decir que podemos
% rotar la figura incluso en 3D, por mas que de momento se vea de solo 2
% dimensiones, utiliza otros ejes para la matriz de rotación y prueba
% también hacer composición de rotaciones en distintos ejes.


% Guarda tus nuevos puntos
x3 = 
y3 =
z3 =

figure
plot3(x1, x2, x3, '.')
xlim([-50 50])
ylim([-50 50])
zlim([-50 50])
xlabel('Eje x')
ylabel('Eje y')
zlabel('Eje z')


