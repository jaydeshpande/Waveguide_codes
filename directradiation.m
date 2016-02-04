i0=1000;
alpha = 1;
f = @(theta,l) sin(theta).*(1-exp(-alpha.*l./sin(theta)));
q = integral(@(theta) f(theta, 1),0, pi/2);
dir = @(t) i0.*q./(alpha*pi.*t);
dir()
% findval= @(l) (100*1000*50)-integral(@(theta) f(theta,l,0.005),0,pi/2);
% tsolve= fsolve(findval,0.5)