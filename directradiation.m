clc;
clear all;
close all;
i0=1000;
mdot=10;
cp=950;
eta=0.9;
dT=50;
energy=mdot*cp*dT/(eta);
alpha = 1;
f = @(theta,l) sin(theta).*(1-exp(-alpha*l./sin(theta)));
q = @(l) integral(@(theta) f(theta, l),0, pi/2);
dir = @(w,l) 2*w*i0*q(l)/(alpha*pi);
findval = @(w) (energy - dir(w,1.4));
wsolve = fsolve(findval, 0.8)
% findval= @(l) (100*1000*50)-integral(@(theta) f(theta,l,0.005),0,pi/2);
% tsolve= fsolve(findval,0.5)