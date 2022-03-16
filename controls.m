function current = controls(Bfield, pqr)

magnetorquer_params;
k=50000;

current = k*cross(pqr, Bfield)/mu;

if sum(abs(current)) > 0.04
    current = current/norm(current)*0.04
end