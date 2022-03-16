function current = controls(Bfield, pqr)

magnetorquer_params;
k=65000;

current = k*cross(pqr, Bfield)/mu;

if sum(abs(current)) > 0.05
    current = current/norm(current)*0.05;
end