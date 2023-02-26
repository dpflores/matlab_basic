clear all, close all, clc

% SIMULACIÓN DE UN ROBOT R-R

l1 = 2; %m
l2 = 2; %m


q1 = 90;     % degrees
q2 = 45;     % degrees


q1 = q1*pi/180;     % to radians
q2 = q2*pi/180;     % to radians


x = l1*cos(q1) + l2*cos(q1 + q2)
y = l1*sin(q1) + l2*sin(q1 + q2)
phi = q1 + q2

% ploteando para revisar si es correcto
draw_rr_robot(l1,l2,q1,q2)



%% Movimiento
clear all, close all, clc
k = 360;

l1 = 2;
l2 = 2;

q1_array = linspace(pi,2*pi,k); % k valores equidistantes entre 0 y 2pi
q2_array = linspace(0,2*pi,k); % k valores equidistantes entre 0 y 2pi

figure;
for i=1:k
    q1 = q1_array(i);
    q2 = q2_array(i);
    draw_rr_robot(l1,l2,q1,q2);
    pause(0.0001);
    hold off;
end







%% Robotics toolbox (Solo ejecutar si se tiene instalado Robotics toolbox)
clear all, close all

l1 = 2;
l2 = 2;


q1 = 45;     % degrees
q2 = 45;     % degrees

L1 = Revolute('a', l1);
L2 = Revolute('a', l2);
L3 = Revolute('a', l2);
rr_bot = SerialLink([L1,L2,L3]);


rr_bot.teach([0,0,0],'noname')



%% Funciones
function [] = draw_rr_robot(l1,l2,q1,q2)

    % Points of the robot
    pA = [0 0];
    pB = [l1*cos(q1) l1*sin(q1)];
    pC = pB + [l2*cos(q1+q2) l2*sin(q1+q2)];
    
    
    % lines
    plot([pA(1) pB(1)], [pA(2) pB(2)],'b','LineWidth',5)
    title("RR-Robot")
    hold on
    plot([pB(1) pC(1)],[pB(2) pC(2)],'r','LineWidth',5)

    % points
    plot(pA(1),pA(2),'black.','MarkerSize',20) 
    plot(pB(1),pB(2),'r.','MarkerSize',30) 
    plot(pC(1),pC(2),'g.','MarkerSize',20) 

    % limit axis
    axis([-5 5 -5 5]) 
    
    % % % %
    % Adicional (solo por el fin de visualizar el efector final
    qe = pi/8;      % angulo de apertura del efector     
    le = 0.5;       % longitud de cada pinza
    

    % Puntos del efector
    pe1 = pC + [le*cos(q1+q2+qe) le*sin(q1+q2+qe)];
    pe2 = pC + [le*cos(q1+q2+-qe) le*sin(q1+q2+-qe)];

    plot([pC(1) pe1(1)], [pC(2) pe1(2)],'g','LineWidth',4)

    plot([pC(1) pe2(1)],[pC(2) pe2(2)],'g','LineWidth',4)
    
    % base del robot
    line([-1,0], [-1, 0], 'Color', 'black');
    line([0,1], [0, -1], 'Color', 'black');
    line([1,-1], [-1, -1], 'Color', 'black');
end