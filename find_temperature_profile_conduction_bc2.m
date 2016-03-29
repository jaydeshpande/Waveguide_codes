function [T]=find_temperature_profile_conduction_bc2(input)
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
T=zeros(n,1);
firstterm=(i0/h)*(1-(2*find_integral(alpha,l)/pi));
x=0;
for i=1:1:n
    xbar=x/l;
    secondterm=(1-(cosh(m*(xbar-0.5))/cosh(m/2)));
    T(i)=Tinf + (firstterm*secondterm);
    x=x+(l/(n-1));
end
end