function [Nu]=find_nusselt_laminar(Re,Pr,D,L)
numerator=0.065*Re*Pr*(D/L);
denominator=1+(0.04*(Re*Pr*D/L)^(2/3));
Nu=3.66+(numerator/denominator);
end