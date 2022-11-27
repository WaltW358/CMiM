% Computational methods in Mechanics
% Walter Nieminen

%% Kinematic analysis

clear all; close all ; clc


a = 0.1; % meters Point O to A
b = 0.2; % meters point A to B
% d = length variable depending on fi and theta
t = linspace(0,1,101); % variable for time
t0 = 0;
omega = rad2deg(1); % rad/s to deg/s
x = [0, 0]'; % [theta, d] vector
fi = 30;
fii = pi/6 + omega*t0;
theetta = (a*sind(fi))/b;
d = @(x) a*cosd(fi) + b*cosd(theetta);
check = a*cosd(fii);
f1 = @(x) a*cosd(fii) + b*cosd(x(1)) - x(2);
f2 = @(x) a*sind(fii) - b*sind(x(1));
%f1der = @(x)-b*sind(x);
%f2der = @(x) cosd(fii) -cosd(x(1));
error = 1;
emax = 1e-6;
n = 0;
%d = a*sind(fi) - b*sind(theta)
%a*cosd(fi) + b*cosd()




while error > emax && n <50
    f = [f1(x);f2(x)];
    J = [b*sind(x(1)), -1;
         -b*cosd(x(2)), 0];
    x = x - J^(-1)*f;
    error = norm(f);
    
    n = n+1;


end
error

figure('Name','Fuck this shit')
    tiledlayout(2,1)
    nexttile
    plot(t,x(1,:))
    hold on
    %plot(t,x())
    grid on
    legend('d')
    nexttile
    plot(t,x(2,:))
    grid on
    legend('thweetta')



% fi = @(t) pi/6 + omega*t; 
% 
% theta = asind((a*sind(fi(t)))/b);
% f2 = @(x) a*cosd(fi(t))+cosd(theta);
% d = f2(t);
% 
% figure('Name','Position of piston')
%     tiledlayout(2,1)
%     nexttile
%     plot(t,d)
%     xlabel('Time [s]')
%     ylabel('Piston distance [m]')
%     grid on
%     nexttile
%     plot(t,theta)
%     grid on
%     ylabel('Angle [deg]')


