function [T]=find_temperature_profile_conduction(input)
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
D = 0.05;
l=0.5;
Trbar=0;
% Calculate Nusselt number only for explicit analysis of materials
% Otherwise get Nusselt number as an input argument
if (Re<2000)
Nu=find_nusselt_laminar(Re,Pr,gc)*gc;
else
Nu=find_nusselt_turbulent(Re,Pr)*gc;
end

%Nu=Nu*l/D;
tsnum=(1/(m*m))-((Nu/m)*Trbar*coth(m/2));
tsden=1-((Nu/m)*coth(m/2));
Tsbar=tsnum/tsden;
xbar=0.5;

T=((Nu/m)*(Tsbar)*((cosh(m*(xbar-0.5))/(sinh(m/2)))))+(1/(m*m));

end