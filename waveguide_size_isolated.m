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
%k = (h*l*l)/(t*m*m); % should appear in rest of the temperature profile
%codes
%k = 1.12; % bk7 thermal conductivity 
k = 0.2; % Acrylic thermal conductivity
% thank you! 
%Tmax = 422; % Maximum temperature [K] attained in the waveguide for bk7
Tmax = 360; % Maximum temperature [K] attained in the waveguide for acrylic
%{
firstterm=i0*l*l/(8*k*(Tmax-Tinf));
secondterm=1-((2/pi)*find_integral(alpha,l));
t=firstterm*secondterm;
%}
firstterm=h*(Tmax-Tinf)/(i0*(1-(2*find_integral(alpha,l)/pi)));
denominator=((2/l)*asech(1-firstterm))^2;
t=h/(k*denominator);
end