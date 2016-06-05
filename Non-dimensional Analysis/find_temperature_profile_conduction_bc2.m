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
T=(1/(m*m))*(1-(1/(cosh(m/2))));
end