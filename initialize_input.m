function [input]=initialize_input(t,l)
i0=1000;
h=1.85;
%k=1.11; % conductivity of bk7
k=0.2; % conductivity of Acrylic
%l=1; % default value
%alpha=0.21033; % alpha of bk7
alpha = 0.5;
n=201;
%t=0.01;
D=t;
m=sqrt(h*l*l/(k*t));
Re=1000;
Pr=7.56; % for water at 17 degree C
Tr=298;
Tinf=298;
input=[i0,h,l,m,alpha,Re,Pr,D,Tr,Tinf,n];
end