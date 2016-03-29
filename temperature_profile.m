clear all;
h=5;
k=0.6;
t=0.005;
l=1;
absrb=0.5;
i0=1000; 
msqr=h*l*l/(k*t);
m=sqrt(msqr);
i=1;
for k=1:1:1
    data = [];
    for x=0:(l/500):l
        xbar(i) = x/l;
        Tbar(i)=(1-(cosh(m*(xbar(i)-0.5))/cosh(m/2)))/msqr;
        i=i+1;
    end
% figure (1);
% plot(xbar,Tbar);
% xlabel('x-');
% ylabel('T-');
    f = @(theta,l) sin(theta).*(1-exp(-absrb*l./sin(theta)))/absrb;
    q = @(l) integral(@(theta) f(theta, l),0, pi/2);
    source = @(t,l) (i0/t)-(2*i0*q(l)/(pi*l*t));
    Tstar=source(t,l)*l*l/k;
    TTinf=Tstar.*Tbar;
    data=[xbar',TTinf'];
    plot(xbar, TTinf);
    dlmwrite(sprintf('tempabsrb=%f.csv',absrb), data);
    hold on;
    absrb=absrb+0.02;
end