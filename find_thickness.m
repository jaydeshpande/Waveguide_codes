function [t]=find_thickness(i0,tmax,alpha,h,k,l)
f = @(theta,l) (1-exp(-alpha*l/sin(theta)))/(alpha*l/sin(theta));
q = @(l) integral(@(theta) f(theta, l),0, pi/2);
denominator = @(l) i0(1-(2*q(l)/pi));
numerator= @(tmax,h) (h*(tmax-t0));
rhs=@(h,k,l,t) (1-sech(0.5*l*sqrt(h/k*t)));
findval = @(t) (numerator(tmax,h)/denominator(l))-rhs(h,k,l,t);
t = fsolve(findval,0.02);