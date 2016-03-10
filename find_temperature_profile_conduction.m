function [T]=find_temperature_profile_conduction(Re,Pr,D,L)
if (Re<2000)
Nu=find_nusselt_laminar(Re,Pr,D,L);
else
Nu=find_nusselt_turbulent(Re,Pr);
end
tsnum=(1/(m*m))-((Nu/m)*Tr*coth(m/2));
tsden=1-(Nu*coth(m/2)/m);
Ts=tsnum/tsden;
firstterm=(i0*l^2)*(1-((2/pi)*find_integral(l)))/(k*t);
secondterm=((Nu/m)*(Ts-Tr)*(cosh(m(xbar-0.5))/sinh(m/2)))+(1/(m*m));
T=Tinf + firstterm*secondterm;
end