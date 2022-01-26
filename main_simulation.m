% Based on ECI frame of earth
Earth

%ICs
altitude = 600e3;  %Approximate orbit altitude of CubeSAT
inclination = 0;                      %Equatorial orbit

%IGRF Setup
IGRF_setup
% Usage: [BX, BY, BZ] = IGRF(TIME, LATITUDE, LONGITUDE, ALTITUDE, COORD)
[Bx, By, Bz] = igrf('01-Jan-2020',0,0,600) %nanotesla

x0 = R + altitude
y0 = 0;
z0 = 0;
semi_major_axis = norm([x0,y0,z0]);   %Circular orbit
vcirc = sqrt(mu/semi_major_axis);
xdot0 = 0;
ydot0 = vcirc*cos(inclination);
zdot0 = vcirc*sin(inclination);
stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];



%Orbital period (Assume circular orbit)
period = 2*pi*sqrt(semi_major_axis^3/mu); %Kepler's third law
num_orbits = 1;
tspan = [0;period*num_orbits];

%Integrate EOM
[tout, stateout] = ode45(@CubeSAT, tspan, stateinitial);
xout = stateout(:,1);
yout = stateout(:,2);
zout = stateout(:,3);

%Plot
[X,Y,Z] = sphere;
X = X*R;
Y = Y*R;
Z = Z*R;

fig = figure();
plot3(xout,yout,zout)
grid on
hold on
surf(X,Y,Z);
axis equal