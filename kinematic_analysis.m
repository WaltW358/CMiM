% Computational methods in Mechanics
% Walter Nieminen

%% Kinematic analysis

clear all; close all ; clc


a = 0.1; % meters Point O to A
b = 0.2; % meters point A to B

t = linspace(0,1,101); % time vector
omega = 1; % rad/s to deg/s

fi = 30;

theetta = asind(a*sind(fi)/b);
d = a*cosd(fi) + b*cosd(theetta);
fii = pi/6 + omega*t;
x0 = [0, b + a]';
x = [0, b + a]';
xdot = [0, 0]';

f1 = @(x) a*cos(fii) + b*cos(x(1)) - x(2);
f2 = @(x) a*sin(fii) - b*sin(x(1));
f1der = @(x) -a*sin(fii) -b*sin(x(1)) - 1;
f2der = @(x) a*cos(fii) -b*cos(x(1));


error = 1;
emax = 1e-6;
n = 1;


while error > emax && n <2
    f = [f1(x);f2(x)];
    J = [-b*sin(x(1)), -1;
         -b*cos(x(1)), 0];
    x = x+ J\-f;
    %x = x - J^(-1)*f;
    error = norm(f);
    
    n = n+1;


end

    thetadot = f1der(x);
    ddot = f2(x);




figure('Name','Does not work')
    tiledlayout(4,1)
    nexttile
    plot(t,x(1,:))
    ylabel('Angle')
    hold on
    %plot(t,x())
    grid on
    nexttile
    plot(t,x(2,:))
    ylabel('Distance')
    grid on
    nexttile
    plot(t,thetadot)
    ylabel('Velocity theetta')
    grid on
    nexttile
    plot(t,ddot)
    grid on
    ylabel('Velocity d')


