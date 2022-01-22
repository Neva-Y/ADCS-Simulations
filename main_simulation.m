% Based on ECI frame of earth

%ICs
altitude = 600e3;
incline = 0;         %equatorial orbit
x0= R + altitude
y0= 0;
z0= 0;
xdot0= 0;
ydot0= vcirc*cos(incline);
zdot0= vcirc*sin*incline);
stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

%Earth Params
R = 6.371e6;
M = 5.972e24;
G = 6.67e-11;

%Orbital period


