function [mu]=find_dyn_viscosity(t)
firstterm=(20-t)/(t+96);
secondterm=1.2378 - ((20-t)*1.303e-03) + ((20-t)*(20-t)*3.06e-06) + ((20-t)*(20-t)*(20-t)*2.55e-08);
logterm=firstterm*secondterm;
mu=10^(logterm)*8.90e-04;
end