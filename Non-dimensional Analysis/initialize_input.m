function [input]=initialize_input(al,gc)
i0=1000;
%al=5; %product of alpha and l
Nu=500; %nusselt number equivalent for hL/k ratio for properties of waveguide
%gc=250; %geometric concentration ratio - ratio of L to t
m=sqrt(Nu*gc);
n=201;
Re=1000;
Pr=7.56; % for water at 17 degree C
Tr=298;
Tinf=298;
input=[i0,al,m,Re,Pr,Tr,Tinf,n,gc];
end