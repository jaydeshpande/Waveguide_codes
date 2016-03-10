clc;
i0=1000;
mdot=1;
cp=950;
eta=0.9;
dT=50;
ng=100;
for k=1:1:4
energy=mdot*cp*dT/(ng*eta);
alpha = 1;
f = @(theta,l) sin(theta).*(1-exp(-alpha*l./sin(theta)));
q = @(l) integral(@(theta) f(theta, l),0, pi/2);
dir = @(w,l) 2*w*i0*q(l)/(alpha*pi);
op=zeros();
i=1;
for l=0.5:0.5:5
    findval = @(w) (energy - dir(w,l));
    wsolve = fsolve(findval, 1);
    op(i,1) = l;
    op(i,2) = wsolve;
    i=i+1;
end
plot(op(:,1),op(:,2));
sheet=k;
% dlmwrite('100guidesalpha1.csv',op,'-append');
hold on;
dT=dT+50;
end
% findval= @(l) (100*1000*50)-integral(@(theta) f(theta,l,0.005),0,pi/2);
% tsolve= fsolve(findval,0.5)