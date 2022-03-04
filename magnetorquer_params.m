r = 0.006; % core radius
Rho = 1.68e-8; % resistivity of copper
mu_r = 5000; % iron relative permeability

d_wire = 0.5e-3;
r_wire = d_wire/2;
l = 0.105; %length of core

layer = 2;
N = layer*l/d_wire; %number of turns
l_wire = N*2*pi*r;
R = (Rho*l_wire)/(pi*r_wire^2); %resistance of wire
Nd = (4*(log(l/r)-1))/((l/r)^2-4*log(l/r));
mu = pi*r^2*N*(1+(mu_r-1)/(1+(mu_r-1)*Nd)); %magnetic dipole