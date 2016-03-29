function [l1,t1]=find_waveguide_size_NU(input)
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
Tmax=600;
% thank you! 
Trbar = find_Tbar(Tr,input);
if (Re<2000)
Nu=find_nusselt_laminar(Re,Pr,D,l)*l/D;
else
Nu=find_nusselt_turbulent(Re,Pr)*l/D;
end
tsnum=(1/(m*m))-((Nu/m)*Trbar*coth(m/2));
tsden=1-((Nu/m)*coth(m/2));
Tsbar=tsnum/tsden;
firstterm= @(l,t) (i0*l*l/(k*t))*(1-((2/pi)*find_integral(alpha,l)));
secondterm=((Nu/m)*(Tsbar-Trbar)*(1/sinh(m/2)))+(1/(m*m));
func = @(l,t) Tmax-Tinf-((i0*l*l/(k*t))*(1-((2/pi)*find_integral(alpha,l)))*((Nu/m)*(Tsbar-Trbar)*(1/sinh(m/2)))+(1/(m*m)));
func2 = @(t) func(5,t);
l1=l;
options = optimoptions('fsolve','Display','iter');
t1=fsolve(func2,5,options);