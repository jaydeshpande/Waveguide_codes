function [Tbar]=find_Tbar(Tin,input)
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
numerator=Tin-Tinf;
generator=(i0/t)*(1-((2/pi)*find_integral(alpha,l)));
denominator=generator*l*l/k;
Tbar=numerator/denominator;
end