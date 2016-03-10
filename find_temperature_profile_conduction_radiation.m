function [T]=find_temperature_profile_conduction_radiation()
denominator = 1- (l*h*(1+exp(-m))/(k*m*(1-exp(-m))))
firstterm = (i0*l/(k*pi*t*m))*((1+exp(-m))/(1-exp(-m)))*find_integral(l);
secondterm = (l*h/(k*m))*((1+exp(-m))/(1-exp(-m)))*Tr;
T = (Tinf + firstterm - secondterm + (1/(m*m)))/denominator;
end