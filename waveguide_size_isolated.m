function [t]=waveguide_size_isolated(input)
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
Tmax=500;
%{
firstterm=i0*l*l/(8*k*(Tmax-Tinf));
secondterm=1-((2/pi)*find_integral(alpha,l));
t=firstterm*secondterm;
%}
firstterm=h*(Tmax-Tinf)/(i0*(1-(2*find_integral(alpha,l)/pi)));
denominator=((2/l)*asech(1-firstterm))^2;
t=h/(k*denominator);
end