function [l1,t1]=find_waveguide_size(input)
% give me all input values please
i0 = input(1);
h = input(2);
l = input(3);
m = input(4);
alpha = input(5);
Re = input(6);
Pr = input(7);
D = input(8);
Tr = input(9);
Tinf = input(10);
n = input(11);
t = D;
k = (h*l*l)/(t*m*m);
% thank you! 
func = @(l,t) (1-sech((l/2)*sqrt(h/(k*t)))) - (h*(Tmax-Tinf)/(i0*(1-(2*find_integral(alpha,l)/pi))));