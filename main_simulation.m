%Initialise
clear
clc
close all
global BxI ByI BzI

% Based on ECI frame of earth
Earth

%ICs
altitude = 400e3;  %Approximate orbit altitude of CubeSAT in meters
inclination = 0;   %Change orbit inclination here, 0 is equitorial

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

%Initialise vectors then loop through stateout to extract magnetic field
BxIout = 0*length(stateout);
ByIout = BxIout;
BzIout = BxIout;

for idx = 1:length(tout)
    dstatedt = CubeSAT(tout(idx), stateout(idx,:));
    BxIout(idx) = BxI;
    ByIout(idx) = ByI;
    BzIout(idx) = BzI;
end

%State Vector
xout = stateout(:,1);
yout = stateout(:,2);
zout = stateout(:,3);

%Plot orbit
[X,Y,Z] = sphere;
X = X*R;
Y = Y*R;
Z = Z*R;

fig = figure();
plot3(xout,yout,zout, 'LineWidth', 3)
grid on
hold on
surf(X,Y,Z);
axis equal

%Plot magnetic field 
fig2 = figure();
plot(tout,BxIout, 'LineWidth', 2)
hold on
grid on
plot(tout,ByIout, 'LineWidth', 2)
plot(tout,BzIout, 'LineWidth', 2)
xlabel('Time (sec)');
ylabel('Magnetic Field (nT)');
legend('x','y','z');