l=1;
t=0.005;
absrb = 0.01;
i0=1000;
w=1;
f = @(theta,l) sin(theta).*(1-exp(-absrb*l./sin(theta)))/absrb;
q = @(l) integral(@(theta) f(theta, l),0, pi/2);
source = @(t,l) (i0/t)-(2*i0*q(l)/(pi*l*t));
dir = @(w,l) w*t*i0*q(l)/(pi*t);
source (t,l)
dir (w,l)/(w*t)