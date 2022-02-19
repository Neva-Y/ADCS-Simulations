function out = TIB(phi,theta,psi)

ct = cos(theta);
st = sin(theta);
sp = sin(phi);
cp = cos(phi);
ss = sin(psi);
cs = cos(psi);

out = [ct*cs,sp*st*cs-cp*ss,cp*st*cs+sp*ss;
    ct*ss,sp*st*ss+cp*cs,cp*st*ss-sp*cs;
    -st,sp*ct,cp*ct];
end

% Copyright - Carlos Montalvo 2015
% You may freely distribute this file but please keep my name in here
% as the original owner