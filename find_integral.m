function [I]=find_integral(alpha,l)
f = @(theta,l) (1-exp(-alpha*l./sin(theta)))./(alpha*l./sin(theta));
q = @(l) integral(@(theta) f(theta, l),0, pi/2);
I= q(l);
end