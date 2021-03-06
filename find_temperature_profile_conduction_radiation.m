function [T]=find_temperature_profile_conduction_radiation(input)
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
Trbar = find_Tbar(Tr,input);
if (Re<2000)
Nu=find_nusselt_laminar(Re,Pr,D,l)*l/D;
else
Nu=find_nusselt_turbulent(Re,Pr)*l/D;
end
generator=(i0/t)*(1-((2/pi)*find_integral(alpha,l)));
denominator=generator*l*l/k;
directrad=(l*0.75*(i0/(pi*t))*find_integral(alpha,l))/(k*denominator);
tsnum=(1/(m*m))-(directrad*coth(m/2)/m)-((Nu/m)*Trbar*coth(m/2));
tsden=1-((Nu/m)*coth(m/2));
Tsbar=tsnum/tsden;
firstterm=(i0*l*l/(k*t))*(1-((2/pi)*find_integral(alpha,l)));
x=0;
for i=1:1:n
    xbar = x/l;
    secondterm=((((Nu/m)*(Tsbar-Trbar))-(directrad/m))*(cosh(m*(xbar-0.5))/sinh(m/2)))+(1/(m*m));
    T(i)=Tinf + firstterm*secondterm;
    x = x + (l/(n-1));
end