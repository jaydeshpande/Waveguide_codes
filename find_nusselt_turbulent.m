function [Nu]=find_nusselt_turbulent(Re,Pr)
f=1/(((0.790*ln(Re))-1.64)^2);
numerator=(f/8)*(Re-1000)*Pr;
denominator=1+(12.7*sqrt(f/8)*((Pr^(2/3))-1));
Nu=numerator/denominator;
end