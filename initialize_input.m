function [input]=initialize_input()
i0=1000;
h=1.85;
k=1.11;
l=1;
alpha=0.21033;
n=201;
t=0.01;
D=t;
m=sqrt(h*l*l/(k*t));
Re=1000;
Pr=7.56; % for water at 17 degree C
Tr=298;
Tinf=298;
input=[i0,h,l,m,alpha,Re,Pr,D,Tr,Tinf,n];
end