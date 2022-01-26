function dstatedt = CubeSAT(t, state)
%Globals
global BxI ByI BzI

x = state(1);
y = state(2);
z = state(3);
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
rho = norm(r);
rhat = r/rho;
Fgrav = -(G*M*m/rho^2)*rhat;

%Convert Cartesian into Lat, Lon, Alt
phiE = 0;
thetaE = acos(z/rho);
psiE = atan2(y,x);
latitude = 90-thetaE*180/pi;
longditude = psiE*180/pi;
rhokm = rho/1000; %km

%IGRF Setup
IGRF_setup
% Usage: [BX, BY, BZ] = IGRF(TIME, LATITUDE, LONGITUDE, ALTITUDE, COORD)
[BN, BE, BD] = igrf('01-Jan-2000', latitude, longditude, rhokm, 'geocentric');
% Convert from NED frame to Inertial frame
BNED = [BN; BE; -BD];  %ECI frame has Down as Up
BI = TIB(phiE, thetaE+pi, psiE)*BNED;
BxI = BI(1);
ByI = BI(2);
BzI = BI(3);

% Dynamics
F = Fgrav; %ignore solar radiation pressure & aerodynamic drag
accel = F/m;

%Derivatives vector
dstatedt = [vel;accel];
