function [cc]=directradiation(input)
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
Il=(i0*gc/pi)*find_integral(al);
cc=Il/i0;
end