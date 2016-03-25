% Script to execute the temperature profile codes, generate plots and do
% post processing
% Author : Jaydeep Deshpande 
% Date : March 10, 2016
% Day : Thursday 
%--------------------------------------------------------------------------
                           % DOCUMENTATION % 
%--------------------------------------------------------------------------
% First part of the code will be a few test runs to make sure the code
% works and gives some standard outputs on the screen
% Second - obtain temperature profile for insulated waveguide boundary
% conditio, convection boundary condition, convection radiation boundary
% condition
% Third - find the waveguide sizes for given lengths and tmax -- helps in 
% selecting waveguide material for a suitable tmax
%--------------------------------------------------------------------------
% clear workspace and previous data
clc;
close all;
clear all;
%--------------------------------------------------------------------------
% Create lists of variables for part I
l = [1 5 10 15 20 25]; % lengths in m
t = [0.005 0.01 0.015 0.02 0.025 0.03]; % waveguide thickness in m 
k = [1 5 10 15 20 25]; % Thermal conductivity W/mK
alpha = [0.001 0.01 0.1 1 10 100]; % absorptivity m-1
i0 = [500 600 700 800 900 1000]; % radiation W/m2 
h = [0 3 6 9 12 15]; % heat transfer coefficient W/m2K
Re = [500 1500 2500 3500 4500 5500]; % reynolds number
Pr = [7.56 24.8 342 1656.81 2000 3000]; % prandtl numbers for water @ 17, salt @  200, paratherm @ 25, therminol 66 @20
%--------------------------------------------------------------------------
% Assign the variable which needs to be treated as parameter 'p'
p = l;
%{
for i=1:1:6 % loop for direct radiation calcualations
input=initialize_input(p(i)); % get input values of all input variables
cr(i) = directradiation(input); % concentration ratio 
end
A=[p;cr];
%}

%{
for i=1:1:6 % loop for temperature profiles 
    input=initialize_input(p(i));
    T(:,i)=find_temperature_profile_conduction(input);
    x=linspace(0,1,input(11))';
end
A=[x T]';
%}
q = alpha;
for j=1:1:6
for i=1:1:6 % loop for waveguide size
    input=initialize_input(p(i),q(j));
    t(i)=waveguide_size_isolated(input);
end
plot(p,t);
hold on;
end
% fname = '/Users/JD/Desktop/Research/Waveguide/Waveguide_codes/Results_Part V/Pr_T.txt';
% fileID=fopen(fname,'w');
% fprintf(fileID,'%6s %12s %12s %12s %12s %12s %12s\n','x',num2str(p(1)),num2str(p(2)),...
%     num2str(p(3)),num2str(p(4)),num2str(p(5)),num2str(p(6)));
% fprintf(fileID,'%6.3f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',A);
% fclose('all');