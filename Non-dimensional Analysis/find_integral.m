function [I]=find_integral(al)
f = @(theta,al) (1-exp(-al./sin(theta)))./(al./sin(theta));
q = @(al) integral(@(theta) f(theta, al),0, pi/2);
I= q(al);
end