function [BB, pqr] = Sensor(BB,pqr)

%Get Sensor Noise Parameters
sensor_params
pollution_loops = 3;


for idx = 1:pollution_loops
    BB(idx) = BB(idx) + MagFieldBias + MagFieldNoise;
    pqr(idx) = pqr(idx) + AngularScaleBias + AngularFieldNoise;
end