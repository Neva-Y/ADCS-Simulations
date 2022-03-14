MagScaleBias = 4e-8; %Teslas
MagFieldBias = MagScaleBias*(2*rand() - 1); %scaled randomly from -1 to 1

MagScaleNoise = 2e-7; %Teslas
MagFieldNoise = MagScaleNoise*(2*rand() - 1); %scaled randomly from -1 to 1


AngularScaleBias = 0.001; %Rad/s
AngularFieldBias = AngularScaleBias*(2*rand() - 1); %scaled randomly from -1 to 1

AngularScaleNoise = 0.0005; %Rad/s
AngularFieldNoise = AngularScaleNoise*(2*rand() - 1); %scaled randomly from -1 to 1