function [T]=find_temperature_profile_conduction_bc2(input)
% give me all input values please
i0 = input(1);
al = input(2);
m = input(3);
Re = input(4);
Pr = input(5);
Tr = input(6);
Tinf = input(7);
n = input(8);
gc = input(9);
% thank you! 
xbar=linspace(0,1,n);
for i=1:1:n
T(i)=(1/(m*m))*(1-(cosh(m*(xbar(i)-0.5))/(cosh(m/2))));
end
end