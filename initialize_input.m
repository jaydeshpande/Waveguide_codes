function [input]=initialize_input()
i0=1000;
h=5;
k=1.11;
l=5;
alpha=0.20857;
n=501;
t=0.01;
D=t;
m=sqrt(h*l*l/(k*t));
Re=1000;
Pr=7.56; % for water at 17 degree C
Tr=373;
Tinf=298;
input=[i0,h,l,m,alpha,Re,Pr,D,Tr,Tinf,n];
end