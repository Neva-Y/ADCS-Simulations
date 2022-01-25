function dstatedt = CubeSAT(t, state)
%x = state(1);
%y = state(2);
%z = state(3);
%xdot = state(4);
%ydot = state(5);
%zdot = state(6);

% inertia and mass
m = 3; %kg


% Kinematics
vel = state(4:6);

% Gravity model (Assume point mass)
Earth
r = state(1:3);
rnorm = norm(r);
rhat = r/rnorm;
Fgrav = -(G*M*m/rnorm^2)*rhat;

% Dynamics
F = Fgrav; %ignore solar radiation pressure & aerodynamic drag
accel = F/m;

%Derivatives vector
dstatedt = [vel;accel];
