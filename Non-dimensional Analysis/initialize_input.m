function [input]=initialize_input(Bi,gc)
i0=1000;
al=0.1; %product of alpha and l (alpha = 0.2, L = 0.5)
%Nu=500; %nusselt number equivalent for hL/k ratio for properties of waveguide
%gc=250; %geometric concentration ratio - ratio of L to t
%Bi=1.3514;
m=sqrt(Bi*gc);
n=201;
Re=1000;
Pr=7.56; % for water at 17 degree C
Tr=298;
Tinf=298;
input=[i0,al,m,Re,Pr,Tr,Tinf,n,gc];
end