function [Nu]=find_nusselt_laminar(Re,Pr,gc)
numerator=0.065*Re*Pr*(1/gc);
denominator=1+(0.04*(Re*Pr/gc)^(2/3));
Nu=3.66+(numerator/denominator);
end