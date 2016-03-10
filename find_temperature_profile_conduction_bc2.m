function [T]=find_temperature_profile_conduction_bc2()
firstterm=i0*(1-(2*find_integral(l)/pi)/h);
secondterm=(1-(cosh(m*(xbar-0.5))/cosh(m/2)));
T=Tinf + (firstterm*secondterm);
end