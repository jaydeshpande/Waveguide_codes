function [Tbar]=find_Tbar(Tin,input)
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
%let h = 3;
numerator=Tin-Tinf;
denominator=(i0*m*m/3)*(1-((2/pi)*find_integral(al)));
Tbar=numerator/denominator;
end